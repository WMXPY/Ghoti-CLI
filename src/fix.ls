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
            name: 'require-not-found'
            value: [
                'mostly is because you are installed wired ghoti version'
                'use "ghoti about"'
            ]
        }
        {
            name: 'ts-is-not-a-Package'
            value: [
                'mostly is because you are installed typescript, but not linked it to the project'
                'use "npm link typescript"'
            ]
        }
        {
            name: 'Cannot-Cast-Null-to-Object-Webpack'
            value: [
                'mostly is because the version of typescript is too low to use awesome-typescript-loader'
                'for win32 use "npm install -g typescript"'
                'for unix use "sudo npm install -g typescript"'
            ]
        }
        {
            name: 'Ghoti-have-no-Components-Configeration'
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: 'Ghoti-have-no-Pages-Configeration'
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: 'Ghoti-have-no-Lambdas-Configeration'
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: 'Ghoti-have-no-Functions-Configeration'
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: 'Ghoti-have-no-Funcs-Configeration'
            value: [
                'mostly is because you are not in a ghoti project folder'
                'go into a ghoti project folder'
            ]
        }
        {
            name: 'Ghoti-have-no-Features-Configeration'
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
            (logPad '| You have to type full error name!', 1)
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