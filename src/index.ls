#!/usr/bin/env node
require! {
    fs
    path
    os
    './func/config': config
    './func/config': { updateConfig }
    './log/log': { log, logHelp, logHelpMore, logInfo, logPostNPMInstall, logAbout, logUnderline, logVersion, logCommand, logSymbol, logUnknown, logStatus, logWhatIs, logUpdate, logList }
    './func/argv': { argv, env, ghotiConfig, path_ghoti }
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
}

const ghoti = ghotiConfig

var ghotiCLIPath
if os.platform! === 'win32'
then ghotiCLIPath = (path.join path_ghoti, "..", "..")
else ghotiCLIPath = (path.join path_ghoti, "..", "..", "lib", "node_modules", "ghoti-cli")

(argv!)

const excute = ->
    var whenDone
    const mode = (env.mode.toLowerCase!)
    switch(mode)
        case 'about'
            (logAbout env)
        case 'empty'
            (logHelp true, env)
        case 'version'
            (logVersion env)
        case 'help'
            (logHelp false, env)
        case 'help+'
            (logHelpMore env)
        case 'status'
            (logStatus ghoti, env)
        case 'info'
            (logInfo env.texture[0], env)
        case 'init'
            whenDone = (logCommand!)
            (init ghotiCLIPath, env.texture[0], env.texture[1], whenDone, env)
        case 'update'
            whenDone = (logUpdate ghoti, env)
            (update whenDone, env)
        case 'whatIs'
            fallthrough
        case 'what'
            fallthrough
        case 'whatis'
            (logWhatIs env.texture[0], env)
        case 'list'
            (logList env)
        case 'fix'
            whenDone = (logCommand!)
            (fix env.texture, ghoti, whenDone, env)
        case 'post'
            (logPostNPMInstall env.texture[0], env)
        case 'lambda'
            whenDone = (logCommand!)
            (lambda ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'feature'
            whenDone = (logCommand!)
            (feature ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'func'
            whenDone = (logCommand!)
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'function'
            whenDone = (logCommand 'function', 'func')
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'page'
            whenDone = (logCommand!)
            (page ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'component'
            whenDone = (logCommand!)
            (component ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone, env)
            (whenDone!)
        case 'underline'
            whenDone = (logUnderline!)
            initUnderline ghoti, whenDone
            whenDone!
        default
            const ameResult = (checkAme mode)
            if ameResult
            then (excuteAme ameResult, env.texture, ghoti, logSymbol, env, ghotiCLIPath, process.cwd!)
            else (logUnknown env)
    void

export excute