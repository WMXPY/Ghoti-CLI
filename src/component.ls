require! {
    fs,
    path,
    './log': { log }
    './config': { updateConfig }
}

const readFile = (root, name) ->
    (fs.readFileSync root, 'utf8').toString!.replace /\${\|component\|}/g, ("ComponentGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

const comImport = (ghoti) ->
    re = (ghoti.components.map ((it) ->
        "import " + it + " from './" + it + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.components.map ((it) ->
        it)).join("\r\n") + "\r\n};"
    re

const component = (root, targetPath, name, ghoti) ->
    const target = (path.join targetPath, "src", "component", name + ".component.tsx" )
    const data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), name)
    fs.writeFileSync target, data, 'utf8'

export component