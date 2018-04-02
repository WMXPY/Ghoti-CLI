require! {
    fs,
    path,
    './common': { comments, verifyNameValiation }
    '../log/log': { log, logPad }
    '../func/config': { updateConfig }
}

(const ghotiLambdaClassName = (name) ->
    "LambdaGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiLambdaFileName = (name) ->
    name + ".lambda")

(const ghotiLambdaExport = (name) ->
    "    " + (ghotiLambdaClassName name) + " as " + name)

(const readFile = (root, name, ghoti) ->
    (var re)
    (re = ((fs.readFileSync root, 'utf8').toString!))
    (re = (re.replace /\${\|lambda\|}/g, (ghotiLambdaClassName name)))
    (re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown"))
    re)

(const comImport = (ghoti) ->
    (if (!(Boolean ghoti.lambdas))
        (log 'ERROR, ghoti have no lambdas configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    var re
    re = comments 'lambdas'
    (re += (ghoti.lambdas.map ((it) ->
        "import * as " + (ghotiLambdaClassName it) + " from './" + (ghotiLambdaFileName it) + "';")).join("\r\n"))
    (re += "\r\n")
    (re += "export {\r\n" + (ghoti.lambdas.map ((it) ->
        (ghotiLambdaExport it) + ",")).join("\r\n") + "\r\n};\r\n")
    re)

(const lambda = (root, targetPath, name, ghoti, whenDone, env) ->
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValiation name, 'lambda', whenDone)
    (if (!(Boolean ghoti.lambdas))
        (log 'ERROR, ghoti have no lambdas configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (for i in ghoti.lambdas
        if (i === name)
            (log '| ERROR: lambda "' + name + '" is already exist')
            (log '| try "ghoti status" to see lambda list')
            (whenDone!)
            (process.exit!))
    (const target = (path.join targetPath, "src", "lambda", name + ".lambda.ts" ))
    (const importTarget = (path.join targetPath, "src", "lambda", "import.ts" ))
    (const data = (readFile (path.join root, "lib", "structure", "lambda", "lambda.ts.ghoti"), name, ghoti))
    (ghoti.lambdas.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| update import setting')
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize lambda script')
    (fs.writeFileSync target, data, 'utf8'))

export lambda