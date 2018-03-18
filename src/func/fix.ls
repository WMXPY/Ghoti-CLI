require! {
    fs
    path
    '../log/log': { log, logPad }
}

const errorList = 
    [
        {
            name: [
                'typescript'
                'is'
                'not'
                'a'
                'package'
            ]
            value: [
                'mostly is because you are installed typescript, but not linked it to the project'
                'use "npm link typescript"'
            ]
        }
        {
            name: [
                'require'
                'not'
                'found'
            ]
            value: [
                'mostly is because you are installed wired ghoti version'
                'use "ghoti about"'
            ]
        }
        {
            name: [
                'typescript'
                'is'
                'not'
                'a'
                'package'
            ]
            value: [
                'mostly is because you are installed typescript, but not linked it to the project'
                'use "npm link typescript"'
            ]
        }
        {
            name: [
                'cannot'
                'cast'
                'null'
                'to'
                'object'
                'webpack'
            ]
            value: [
                'mostly is because the version of typescript is too low to use awesome-typescript-loader'
                'for win32 use "npm install -g typescript"'
                'for unix use "sudo npm install -g typescript"'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'components'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'pages'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'lambdas'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'functions'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'guncs'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: [
                'ghoti'
                'have'
                'no'
                'features'
                'configeration'
            ]
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
    ]

const autoFix = (ghoti, env?) ->
    (logPad '| Function is not supported yet :(, sorry', 1)
    (logPad '| Please let me know if you have issue', 1)
    (logPad '| Try "ghoti about"', 1)
    void

const findError = (errorNameListE) ->
    const errorNameList = errorNameListE.map (it) ->
        it.toLowerCase!
    var count
    for i in errorList
        count = 0
        for j in i.name
            if (errorNameList.indexOf (j.toLowerCase!)) !== -1
            then count++
        if count === i.name.length
        then return i
    null

const findSim = (errorNameListE) ->
    const errorNameList = errorNameListE.map (it) ->
        it.toLowerCase!
    const sameList = []
    var count
    for i in errorList
        count = 0
        for j in i.name
            if (errorNameList.indexOf (j.toLowerCase!)) !== -1
            then count++
        if count >= (parseInt i.name.length / 2)
        then (sameList.push i)
    sameList

const logError = (errorNameList, ghoti, env?) ->
    const errorObj = (findError errorNameList)
    if errorObj
    then 
        (logPad '| Solution for "' + (errorObj.name.join ' ') + '":', 1)
        (errorObj.value.map (it) ->
            (logPad '* ' + it, 2)
            void)
    else 
        const list = (findSim errorNameList)
        if list.length > 0
        then 
            (logPad '| "' + (errorNameList.join ' ') + '" is not in the list', 1)
            (logPad '| Still, there are some similar error: ', 1)
            (list.map (it) ->
                (logPad '* ' + (it.name.join ' '), 2)
                void)
            (logPad '| Use "ghoti fix [...issue name]" to checkout solution', 1)
            (logPad '| You have to type full error name!', 1)
        else
            (logPad '| Error "' + (errorNameList.join ' ') + '" is not in the list', 1)
        (logPad '| Let me know your issue?', 1)
        (logPad '| Try "ghoti about"', 1)
    void

const fix = (errorNameList, ghoti, whenDone, env?) ->
    if errorNameList.length > 0
    then (logError errorNameList, env)
    else (autoFix env)
    (whenDone!)
    void

export fix