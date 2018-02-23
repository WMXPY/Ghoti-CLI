#!/usr/bin/env node
require! {
    fs,
    path,
    './config': config
    './config': { updateConfig }
    './log': { log }
    './argv': { argv, env, ghotiConfig, path_ghoti }
    './init': { init }
    './component': { component }
}

const ghoti = ghotiConfig
const ghotiCLIPath = (path.join path_ghoti, "..", "..")
argv!

log ghoti

const excute = ->
    switch(env.mode)
        case 'help'
            (log env)
        case 'init'
            (init ghotiCLIPath, env.texture[0], env.texture[1])
        case 'component'
            (component ghotiCLIPath, process.cwd!, env.texture[0], ghoti)
        default
            (log 'mode undefined')
            return void
    void

excute!
# log env
# init 'react', './a/'
# log config.initConfig 'react'