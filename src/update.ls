require! {
    fs
    path
    './log': { log, logPostInstall }
    './parser': { parseAll, parseFile }
}

(const update = (whenDone, env) ->
    (whenDone!)
    void)

export update