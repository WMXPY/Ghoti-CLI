require! {
    fs
    path
    './log': { log, logPad }
}

const autoFix = (env?) ->
    1

const logError = (errorName, env?) ->
    1

const fix = (errorName, whenDone, env?) ->
    if errorName
    then (logError errorName, env)
    else (autoFix env)
    (whenDone!)
    void

export fix