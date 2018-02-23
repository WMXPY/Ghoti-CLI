require! {
    fs,
    path,
    './log': { log }
    './config': { updateConfig }
}

const ghotiPageClassName = (name) ->
    "PageGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length)

const ghotiPageFileName = (name) ->
    name + ".page"

const ghotiPageExport = (name) ->
    "    " + (ghotiPageClassName name) + " as " + name

const readFile = (root, name) ->
    ((fs.readFileSync root, 'utf8').toString!.replace /\${\|page\|}/g, (ghotiPageClassName name))

const comImport = (ghoti) ->
    re = (ghoti.pages.map ((it) ->
        "import " + (ghotiPageClassName it) + " from './" + (ghotiPageFileName it) + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.pages.map ((it) ->
        (ghotiPageExport it) + ",")).join("\r\n") + "\r\n};"
    re

const page = (root, targetPath, name, ghoti) ->
    const target = (path.join targetPath, "src", "page", name + ".page.tsx" )
    const importTarget = (path.join targetPath, "src", "page", "import.ts" )
    const data = (readFile (path.join root, "lib", "react", "page", "page.tsx.ghoti"), name)
    (ghoti.pages.push name)
    (updateConfig ghoti)
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (fs.writeFileSync target, data, 'utf8')

export page