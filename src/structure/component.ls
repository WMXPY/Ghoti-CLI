require! {
    fs,
    path,
    '../log': { log, logPad }
    '../config': { updateConfig }
}

(const ghotiComponentClassName = (name) ->
    "ComponentGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiComponentFileName = (name) ->
    name + ".component")

(const ghotiComponentExport = (name) ->
    "    " + (ghotiComponentClassName name) + " as " + name)

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
    (re = (ghoti.components.map ((it) ->
        "import " + (ghotiComponentClassName it) + " from './" + (ghotiComponentFileName it) + "';")).join("\r\n"))
    (re += "\r\n")
    (re += "export {\r\n" + (ghoti.components.map ((it) ->
        (ghotiComponentExport it) + ",")).join("\r\n") + "\r\n};")
    re)

(const component = (root, targetPath, name, ghoti, whenDone, env) ->
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
    (switch ghoti.type
        case 'react'
            data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), name, ghoti)
            target = (path.join targetPath, "src", "component", name + ".component.tsx" )
            importTarget = (path.join targetPath, "src", "component", "import.ts" )
        case 'react-js'
            data = (readFile (path.join root, "lib", "react-js", "component", "component.tsx.ghoti"), name, ghoti)
            target = (path.join targetPath, "src", "component", name + ".component.jsx" )
            importTarget = (path.join targetPath, "src", "component", "import.js" )
        default
            (log '| ERROR: type "' + ghoti.type + '" is not support')
            (log '| try "ghoti status" to see current type issue')
            (log '| try "ghoti whatis ' + ghoti.type + '" is there any known issue')
            (whenDone!)
            (process.exit!))
    (ghoti.components.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| update import setting')
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize component script')
    (fs.writeFileSync target, data, 'utf8'))

export component