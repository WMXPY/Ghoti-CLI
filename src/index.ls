#!/usr/bin/env node
require! {
    fs,
    path,
    './config': config
    './log': { log }
    './argv': { argv, env, ghotiConfig, path_ghoti }
    './init': { init }
    './component': { component }
}

const ghoti = ghotiConfig
argv!

log ghoti

const excute = ->
    switch(env.mode)
        case 'help'
            log env
        case 'init'
            init env.texture[0], env.texture[1]
        case 'component'
            component (path.join path_ghoti, "..", ".."), process.cwd!, ghoti
        default
            log 'mode undefined'
            return void
    void

excute!
# log env
# init 'react', './a/'
# log config.initConfig 'react'