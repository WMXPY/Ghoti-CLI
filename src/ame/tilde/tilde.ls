require! {
    '../../log/std': { log, logPad }
    '../../func/config': { writeCLIConfig, readCLIConfig }
    child_process: { exec }
}

const execute = (program, str) !->
    const cmd = 'echo ' + str + ' | ' + program
    exec cmd
    
const reportAndEnd = (message, whenDone) !->
    logPad '| Execute failed', 1
    logPad '| Error: ' + message, 1
    whenDone!
    process.exit 1

const executeTilde = (suffix, env, whenDone) !->
    const config = readCLIConfig!
    const tilde = config.tilde
    var done
    if !(tilde || tilde.length)
    then reportAndEnd 'Config error', whenDone
    else
    then 
        done = false
        for i in tilde
        then if i.name === suffix
        then 
            log suffix
            done = true
    if !done
    then reportAndEnd 'Unknown command', whenDone
    whenDone!

const addTilde = (whenDone) !->
    whenDone!

export addTilde
export executeTilde

export reportAndEnd
export execute
