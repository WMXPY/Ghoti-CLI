require! {
    fs
    path
    '../log/log': { log, logPostInstall }
    './parser/parser': { parseAll, parseFile }
}

(const update = (whenDone, env) ->
    (log 'Lastest version of ghoti-cli always be better')
    (log 'Try "npm install -g ghoti-cli@latest"')
    (whenDone!)
    void)

export update