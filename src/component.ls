require! {
    fs,
    path,
    './log': { log }
}

const readFile = (root, name) ->
    (fs.readFileSync root, 'utf8').toString!.replace /\${\|component\|}/g, name

const comImport = (ghoti) ->
    re = (ghoti.components.map ((it) ->
        "import " + it + " from './" + it + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.components.map ((it) ->
        it)).join("\r\n") + "\r\n};"
    re

const component = (root, targetPath, ghoti) ->
    const target = (path.join targetPath, "src", "component")
    const data = (readFile (path.join root, "lib", "react", "component", "component.tsx.ghoti"), "test")
    fs.writeFileSync target, data, 'utf8'
    # log comImport ghoti

export component