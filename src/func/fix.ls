require! {
    fs
    path
    '../log/log': { log, logPad }
    '../static/fix': { findError, findSim }
}

const autoFix = (ghoti, env?) ->
    (logPad '| Function is not supported yet :(, sorry', 1)
    (logPad '| Please let me know if you have issue', 1)
    (logPad '| Try "ghoti about"', 1)
    void

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