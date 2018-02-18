require! {
    './config.ls': config
    './log.ls': { log }
    './argv.ls': { argv, env }
    './init.ls': { copyInit }
    './parser.ls': { parseAll }
}

parseAll 'test'

# log argv!
# log env

# log config.initConfig 'react'