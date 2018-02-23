#!/usr/bin/env node
require! {
    fs,
    path,
    './config': config
    './config': { updateConfig }
    './log': { log, logHelp, logInfo, logAbout, logVersion, logCommand, logUnknown }
    './argv': { argv, env, ghotiConfig, path_ghoti }
    './init': { init }
    './component': { component }
}

const ghoti = ghotiConfig
const ghotiCLIPath = (path.join path_ghoti, "..", "..")
argv!

const excute = ->
    switch(env.mode)
        case 'about'
            (logAbout!)
        case 'empty'
            (logHelp true)
        case 'version'
            (logVersion!)
        case 'help'
            (logHelp!)
        case 'info'
            (logInfo env.texture[0])
        case 'init'
            (logCommand!)
            (init ghotiCLIPath, env.texture[0], env.texture[1])
        case 'component'
            (logCommand!)
            (component ghotiCLIPath, process.cwd!, env.texture[0], ghoti)
        default
            (logUnknown!)
    void

excute!
# log env
# init 'react', './a/'
# log config.initConfig 'react'