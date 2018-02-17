require! {
    './config.ls': config
    './log.ls': { log }
    './argv.ls': { argv, env }
}

log argv!
log env

# log config.initConfig 'react'