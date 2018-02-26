#!/usr/bin/env node
require! {
    fs
    path
    os
    './config': config
    './config': { updateConfig }
    './log': { log, logHelp, logInfo, logAbout, logVersion, logCommand, logUnknown, logStatus, logWhatIs }
    './argv': { argv, env, ghotiConfig, path_ghoti }
    './init': { init }
    './component': { component }
    './page': { page }
    './lambda': { lambda }
    './func': { func }
}

const ghoti = ghotiConfig

var ghotiCLIPath
if os.platform! === 'win32'
then ghotiCLIPath = (path.join path_ghoti, "..", "..")
else ghotiCLIPath = (path.join path_ghoti, "..", "..", "lib", "node_modules", "ghoti-cli")

argv!

const excute = ->
    var whenDone
    switch(env.mode)
        case 'about'
            (logAbout!)
        case 'empty'
            (logHelp true)
        case 'version'
            (logVersion!)
        case 'help'
            (logHelp!)
        case 'status'
            (logStatus ghoti)
        case 'info'
            (logInfo env.texture[0])
        case 'init'
            whenDone = (logCommand!)
            (init ghotiCLIPath, env.texture[0], env.texture[1], whenDone)
        case 'whatIs'
            fallthrough
        case 'what'
            fallthrough
        case 'whatis'
            (logWhatIs env.texture[0])
        case 'lambda'
            whenDone = (logCommand!)
            (lambda ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone)
            (whenDone!)
        case 'func'
            whenDone = (logCommand!)
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone)
            (whenDone!)
        case 'function'
            whenDone = (logCommand 'function', 'func')
            (func ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone)
            (whenDone!)
        case 'page'
            whenDone = (logCommand!)
            (page ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone)
            (whenDone!)
        case 'component'
            whenDone = (logCommand!)
            (component ghotiCLIPath, process.cwd!, env.texture[0], ghoti, whenDone)
            (whenDone!)
        default
            (logUnknown!)
    void

export excute