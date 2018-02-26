require! {
    fs,
    path,
    './log': { log }
    './config': { updateConfig }
}

const ghotiComponentClassName = (name) ->
    "ComponentGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length)

const ghotiComponentFileName = (name) ->
    name + ".component"

const ghotiComponentExport = (name) ->
    "    " + (ghotiComponentClassName name) + " as " + name

const readFile = (root, name, ghoti) ->
    re = ((fs.readFileSync root, 'utf8').toString!)
    re = (re.replace /\${\|component\|}/g, (ghotiComponentClassName name))
    re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown")
    re

const comImport = (ghoti) ->
    re = (ghoti.components.map ((it) ->
        "import " + (ghotiComponentClassName it) + " from './" + (ghotiComponentFileName it) + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.components.map ((it) ->
        (ghotiComponentExport it) + ",")).join("\r\n") + "\r\n};"
    re

const component = (root, targetPath, name, ghoti, whenDone) ->
    for i in ghoti.components
        if(i === name)
            log '| ERROR: component "' + name + '" is already exist'
            log '| try "ghoti status" to see component list'
            whenDone!
            process.exit!
    const target = (path.join targetPath, "src", "component", name + ".component.tsx" )
    const importTarget = (path.join targetPath, "src", "component", "import.ts" )
    const data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), name, ghoti)
    (ghoti.components.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| update import setting')
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize component script')
    (fs.writeFileSync target, data, 'utf8')

export component