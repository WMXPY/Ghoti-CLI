#!/usr/bin/env node
require! {
    './config': config
    './log': { log }
    './argv': { argv, env, ghotiConfig }
    './init': { init }
}

const ghoti = ghotiConfig
argv!

const excute = ->
    switch(env.mode)
        case 'help'
            log env
        case 'init'
            init env.texture[0], env.texture[1]
        case 'component'
            log env
        default
            log 'mode undefined'
            return void
    void

excute!
# log env
# init 'react', './a/'
# log config.initConfig 'react'