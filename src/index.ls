#!/usr/bin/env node
require! {
    './config': config
    './log': { log }
    './argv': { argv, env, ghotiConfig }
    './init': { init }
}

const ghoti = ghotiConfig

const excute = ->
    switch(env.mode)
        case 'help'
            log env
        case 'init'
            log env
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