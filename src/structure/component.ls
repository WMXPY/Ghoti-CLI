require! {
    fs,
    path,
    './common': { comments, verifyNameValiation }
    '../log/log': { log, logPad }
    '../func/config': { updateConfig }
}

(const ghotiComponentClassName = (name) ->
    "ComponentGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiComponentFileName = (name, vue?) ->
    if vue
    then name + '.component.vue'
    else name + ".component")

(const ghotiComponentExport = (name) ->
    "    " + (ghotiComponentClassName name) + " as " + name)

const ghotiComponentExportVue = (name) ->
    "        Vue.component('" + name + "', " + (ghotiComponentClassName name) + ");"

(const readFile = (root, name, ghoti) ->
    (var re)
    (re = ((fs.readFileSync root, 'utf8').toString!))
    (re = (re.replace /\${\|component\|}/g, (ghotiComponentClassName name)))
    (re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown"))
    re)

(const comImport = (ghoti) ->
    (if (!(Boolean ghoti.components))
        (log 'ERROR, ghoti have no components configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    var re
    re = comments 'components'
    (re += (ghoti.components.map ((it) ->
        "import " + (ghotiComponentClassName it) + " from './" + (ghotiComponentFileName it) + "';")).join("\r\n"))
    (re += "\r\n")
    (re += "export {\r\n" + (ghoti.components.map ((it) ->
        (ghotiComponentExport it) + ",")).join("\r\n") + "\r\n};\r\n")
    re)

const comVueAddon = (ghoti) ->
    (if (!(Boolean ghoti.components))
        (log 'ERROR, ghoti have no components configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    var re
    re = comments 'components'
    re += 'import Vue, { VueConstructor } from \'vue\';\r\n\r\n'
    (re += (ghoti.components.map ((it) ->
        "import " + (ghotiComponentClassName it) + " from './" + (ghotiComponentFileName it, true) + "';")).join("\r\n"))
    (re += "\r\n\r\n")
    re += "export default {\r\n"
    re += "    install: (Vue: VueConstructor, options?: any) => {\r\n"
    re += (ghoti.components.map ((it) ->
        (ghotiComponentExportVue it))).join("\r\n")
    re += "\r\n    },\r\n};\r\n"
    re

(const component = (root, targetPath, name, ghoti, whenDone, env) ->  
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValiation name, 'component', whenDone)
    (if (!(Boolean ghoti.components))
        (logPad '| ERROR, ghoti have no components configeration', 1)
        (logPad '| Try to fix it: "ghoti fix"', 1)
        (whenDone!)
        (process.exit!))
    (for i in ghoti.components
        if (i === name)
            (log '| ERROR: component "' + name + '" is already exist')
            (log '| try "ghoti status" to see component list')
            (whenDone!)
            (process.exit!))
    (var data, target, importTarget)
    (switch ghoti.template
        case 'react'
            data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), name, ghoti)
            target = (path.join targetPath, "src", "component", name + ".component.tsx" )
            importTarget = (path.join targetPath, "src", "component", "import.ts" )
        case 'react-js'
            data = (readFile (path.join root, "lib", "react-js", "component", "component.jsx.ghoti"), name, ghoti)
            target = (path.join targetPath, "src", "component", name + ".component.jsx" )
            importTarget = (path.join targetPath, "src", "component", "import.js" )
        case 'vue'
            data = (readFile (path.join root, "lib", "vue", "component", "component.vue.ghoti"), name, ghoti)
            target = (path.join targetPath, "src", "component", name + ".component.vue" )
            importTarget = (path.join targetPath, "src", "component", "addon.ts" )
        default
            (log '| ERROR: type "' + ghoti.template + '" is not supported')
            (log '| Try "ghoti status" to see current type issue')
            (log '| Try "ghoti whatis ' + ghoti.template + '" is there any known issue')
            (whenDone!)
            (process.exit!))
    (ghoti.components.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    switch ghoti.template
        case 'vue'
            (log '| update addon setting')
            (fs.writeFileSync importTarget, (comVueAddon ghoti), 'utf8')
        default
            (log '| update import setting')
            (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize component script')
    (fs.writeFileSync target, data, 'utf8'))

export component