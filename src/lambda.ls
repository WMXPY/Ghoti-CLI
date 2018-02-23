require! {
    fs,
    path,
    './log': { log }
    './config': { updateConfig }
}

const ghotiLambdaClassName = (name) ->
    "LambdaGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length)

const ghotiLambdaFileName = (name) ->
    name + ".lambda"

const ghotiLambdaExport = (name) ->
    "    " + (ghotiLambdaClassName name) + " as " + name

const readFile = (root, name) ->
    ((fs.readFileSync root, 'utf8').toString!.replace /\${\|lambda\|}/g, (ghotiLambdaClassName name))

const comImport = (ghoti) ->
    re = (ghoti.lambdas.map ((it) ->
        "import * as " + (ghotiLambdaClassName it) + " from './" + (ghotiLambdaFileName it) + "';")).join("\r\n")
    re += "\r\n"
    re += "export {\r\n" + (ghoti.lambdas.map ((it) ->
        (ghotiLambdaExport it) + ",")).join("\r\n") + "\r\n};"
    re

const lambda = (root, targetPath, name, ghoti) ->
    const target = (path.join targetPath, "src", "lambda", name + ".lambda.ts" )
    const importTarget = (path.join targetPath, "src", "lambda", "import.ts" )
    const data = (readFile (path.join root, "lib", "react", "lambda", "lambda.ts.ghoti"), name)
    (ghoti.lambdas.push name)
    (updateConfig ghoti)
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (fs.writeFileSync target, data, 'utf8')

export lambda