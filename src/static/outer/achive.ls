require! {
    path
    fs
    os
    'child_process': { spawn }
    '../../func/config': { writeCLIConfig, readCLIConfig }
    '../../log/std': { log, logPad }
}

const downloadPack = (packUrl) ->
    packUrl
    void

const expendPack = (filpath, targetPath, whenDone, env) ->
    const cliConfig = readCLIConfig!
    if cliConfig.external
    then 
        for i in cliConfig.external
        then 
            log i
    else
        log '| ghoti config file is not exist in storage list'
        log '| Try to reinstall ghoti-cli by "sudo npm -g install ghoti-cli"'
        whenDone!
        process.exit!
    switch os.platform!
        case 'win32'
            archiveWin32 filpath, targetPath
        case 'darwin'
            command = 1
        default
            command = 1
    void

const archiveWin32 = (filePath, targetPath) ->
    log filePath

export expendPack