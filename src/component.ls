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

const readFile = (root, name) ->
    ((fs.readFileSync root, 'utf8').toString!.replace /\${\|component\|}/g, (ghotiComponentClassName name))

const comImport = (ghoti) ->
    re = (ghoti.components.map ((it) ->
        "import " + (ghotiComponentClassName it) + " from './" + (ghotiComponentFileName it) + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.components.map ((it) ->
        (ghotiComponentExport it) + ",")).join("\r\n") + "\r\n};"
    re

const component = (root, targetPath, name, ghoti) ->
    const target = (path.join targetPath, "src", "component", name + ".component.tsx" )
    const importTarget = (path.join targetPath, "src", "component", "import.ts" )
    const data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), name)
    (ghoti.components.push name)
    (updateConfig ghoti)
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (fs.writeFileSync target, data, 'utf8')

export component