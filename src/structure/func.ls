require! {
    fs,
    path,
    './common': { comments, verifyNameValiation }
    '../log/log': { log, logPad }
    '../func/config': { updateConfig }
}

const ghotiFuncClassName = (name) ->
    "FuncGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length)

const ghotiFuncFileName = (name) ->
    name + ".func"

const ghotiFuncExport = (name) ->
    "    " + (ghotiFuncClassName name) + " as " + name

const readFile = (root, name, ghoti) ->
    re = ((fs.readFileSync root, 'utf8').toString!)
    re = (re.replace /\${\|func\|}/g, (ghotiFuncClassName name))
    re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown")
    re

const comImport = (ghoti) ->
    if !Boolean ghoti.funcs
        (log 'ERROR, ghoti have no functions configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!)
    var re
    re = comments 'funcs'
    re += ((ghoti.funcs.map ((it) ->
        "import * as " + (ghotiFuncClassName it) + " from './" + (ghotiFuncFileName it) + "';")).join("\r\n"))
    re += "\r\n"
    re += "export {\r\n" + (ghoti.funcs.map ((it) ->
        (ghotiFuncExport it) + ",")).join("\r\n") + "\r\n};\r\n"
    re

const func = (root, targetPath, name, ghoti, whenDone, env) ->
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValiation name, 'func', whenDone)
    if !Boolean ghoti.funcs
        (log 'ERROR, ghoti have no functions configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!)
    for i in ghoti.funcs
        if(i === name)
            log '| ERROR: function "' + name + '" is already exist'
            log '| try "ghoti status" to see function list'
            (whenDone!)
            (process.exit!)
    const target = (path.join targetPath, "src", "func", name + ".func.ts" )
    const importTarget = (path.join targetPath, "src", "func", "import.ts" )
    const data = (readFile (path.join root, "lib", "structure", "func", "func.ts.ghoti"), name, ghoti)
    (ghoti.funcs.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| update import setting')
    (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize function script')
    (fs.writeFileSync target, data, 'utf8')

export func