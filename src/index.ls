require! {
    './config.ls': config
    './log.ls': { log }
    './argv.ls': { argv, env }
    './init.ls': { init }
}

# log argv!
# log env
init 'react', './a/'
# log config.initConfig 'react'