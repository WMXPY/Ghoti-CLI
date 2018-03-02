require! {
    fs
    path
    './log': { log, logPad }
}

const errorList = 
    [
        {
            name: 'Typescript-is-not-a-Package'
            value: [
                'mostly is because you are installed typescript, but not linked it to the project'
                'use "npm link typescript"'
            ]
        }
        {
            name: 'Cannot-Cast-Null-to-Object'
            value: [
                'mostly is because the version of typescript is too low to use awesome-typescript-loader'
                'use "npm install -g typescript"'
                'use "sudo npm install -g typescript"'
            ]
        }
    ]

const autoFix = (ghoti, env?) ->
    (logPad '| Function is not supported yet :(, sorry', 1)
    (logPad '| Please let me know if you have issue', 1)
    (logPad '| Try "ghoti about"', 1)
    void

const findError = (errorName) ->
    for i in errorList
        if i.name === errorName
            return i
    null

const findSim = (errorName) ->
    const sameList = []
    for i in errorList
        if ((i.name.toUpperCase!).indexOf (errorName.toUpperCase!)) !== -1
            (sameList.push i)
    sameList

const logError = (errorName, ghoti, env?) ->
    const errorObj = (findError errorName)
    if errorObj
    then 
        (logPad '| Solution for "' + errorObj.name + '":', 1)
        (errorObj.value.map (it) ->
            (logPad '* ' + it, 2)
            void)
    else 
        const list = (findSim errorName)
        if list.length > 0
        then 
            (logPad '| "' + errorName + '" is not in the list', 1)
            (logPad '| Still, there are some similar error: ', 1)
            (list.map (it) ->
                (logPad '* ' + it.name, 2)
                void)
            (logPad '| Use "ghoti fix [issue name]" to checkout solution', 1)
        else
            (logPad '| Error "' + errorName + '" is not in the list', 1)
        (logPad '| Let me know your issue?', 1)
        (logPad '| Try "ghoti about"', 1)
    void

const fix = (errorName, ghoti, whenDone, env?) ->
    if errorName
    then (logError errorName, env)
    else (autoFix env)
    (whenDone!)
    void

export fix