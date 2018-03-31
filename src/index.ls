#!/usr/bin/env node
require! {
    fs
    path
    './func/config': config
    './func/config': { updateConfig, cliPath }
    './log/log': { log, logHelp, logHelpMore, logInfo, logPostNPMInstall, logAbout, logUnderline, logVersion, logCommand, logSymbol, logUnknown, logStatus, logWhatIs, logUpdate, logList, logFileList, logGame, logGameCommand }
    './func/argv': { argv, env, ghotiConfig }
    './func/init': { init }
    './structure/component': { component }
    './structure/page': { page }
    './structure/lambda': { lambda }
    './structure/func': { func }
    './structure/feature': { feature }
    './func/fix': { fix }
    './func/update': { update }
    './ame/init': { initUnderline }
    './ame/excute': { checkAme, excuteAme }
    './game/game': { minigame }
    './func/file': { file }
}

const excute = (mucall?) ->
    (const ghoti = ghotiConfig)
    (const ghotiCLIPath = cliPath!)  
    (argv!)
    (var whenDone)
    if env
    then for i of mucall 
    then env[i] = mucall[i]
    const mode = (env.mode.toLowerCase!)
    switch(mode)
        case 'a'
            fallthrough
        case 'about'
            (logAbout env)
        case 'empty'
            (logHelp true, env)
        case 'v'
            fallthrough
        case 'version'
            (logVersion env)
        case '?'
            fallthrough
        case 'help'
            (logHelp false, env)
        case '?+'
            fallthrough
        case 'help+'
            (logHelpMore env)
        case 'stat'
            fallthrough
        case 'status'
            (logStatus ghoti, env)
        case 'inf'
            fallthrough
        case 'info'
            (logInfo env.texture[0], env)
        case 'i'
            fallthrough
        case 'create'
            fallthrough
        case 'template'
            fallthrough
        case 'init'
            whenDone = (logCommand!)
            (init ghotiCLIPath, env.texture[0], env.texture[1], whenDone, env)
        case 'f'
            fallthrough
        case 'file'
            whenDone = (logCommand!)
            file ghotiCLIPath, env.texture[0], env.texture[1], whenDone, env
        case 'example'
            whenDone = (logCommand!)
            (init ghotiCLIPath, 'ghoti-example', env.texture[0], whenDone, env)
        case 'update'
            whenDone = (logUpdate ghoti, env)
            (update whenDone, env)
        case 'w'
            fallthrough
        case '='
            fallthrough
        case 'whatIs'
            fallthrough
        case 'what'
            fallthrough
        case 'whatis'
            (logWhatIs env.texture[0], env)
        case 'lt'
            fallthrough
        case 'types'
            fallthrough
        case 'list'
            (logList env)
        case 'lf'
            fallthrough
        case 'files'
            fallthrough
        case 'listFile'
            (logFileList env)
        case '~'
            fallthrough
        case 'issue'
            fallthrough
        case 'fix'
            whenDone = (logCommand!)
            (fix env.texture, ghoti, whenDone, env)
        case 'hint'
            fallthrough
        case 'post'
            (logPostNPMInstall env.texture[0], env)
        case '+l'
            fallthrough
        case 'lambda'
            whenDone = (logCommand!)
            (lambda ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case '+t'
            fallthrough
        case 'feature'
            whenDone = (logCommand!)
            (feature ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case '+f'
            fallthrough
        case 'func'
            whenDone = (logCommand!)
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'function'
            whenDone = (logCommand 'function', 'func')
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case '+p'
            fallthrough
        case 'page'
            whenDone = (logCommand!)
            (page ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case '+c'
            fallthrough
        case 'component'
            whenDone = (logCommand!)
            (component ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'underline'
            whenDone = (logUnderline!)
            (initUnderline ghoti, whenDone)
        case 'g'
            fallthrough
        case 'game'
            fallthrough
        case 'minigame'
            whenDone = (logGame!)
            minigame ghoti, whenDone
        case 'frog'
            whenDone = (logGameCommand!)
        default
            (const ameResult = (checkAme mode))
            (if ameResult
            then (excuteAme ameResult, env.texture, ghoti, logSymbol, env, ghotiCLIPath, process.cwd!)
            else (logUnknown env))
    void

export excute