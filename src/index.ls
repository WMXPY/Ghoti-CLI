#!/usr/bin/env node
require! {
    fs
    path
    os
    './config': config
    './config': { updateConfig }
    './log': { log, logHelp, logHelpMore, logInfo, logPostNPMInstall, logAbout, logVersion, logCommand, logUnknown, logStatus, logWhatIs, logUpdate, logList }
    './argv': { argv, env, ghotiConfig, path_ghoti }
    './init': { init }
    './structure/component': { component }
    './structure/page': { page }
    './structure/lambda': { lambda }
    './structure/func': { func }
    './structure/feature': { feature }
    './fix': { fix }
    './update': { update }
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
            (fix env.texture[0], ghoti, whenDone, env)
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
        default
            (logUnknown env)
    void

export excute