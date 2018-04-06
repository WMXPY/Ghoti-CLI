require! {
    path
    fs
    request
    os
    'child_process': { spawn }
    '../../func/config': { writeCLIConfig, readCLIConfig }
    '../../log/std': { log, logPad }
    '../../func/deepclone': { deepClone, uniqueId }
}

const downloadPack = (uri, filename, callback) ->
    const stream = fs.createWriteStream filename
    ((request uri).pipe stream).on 'close', callback
    void

const parseLink = (linkE, whenDone) ->
    const splited = linkE.split /:\/\/|\//g
    if splited.length <= 0
    then
        log '| Not a vaild link'
        whenDone!
        process.exit!
    const protocal = (splited.shift!).toLowerCase!
    var link, next
    switch protocal
        case 'github'
            next = 'download'
            link = 'https://raw.githubusercontent.com/' + (splited.join '/')
        case 'file'
            next = 'file'
            link = linkE
        default
            log '| Not a vaild link'
            whenDone!
            process.exit!
    {
        next
        link
    }

const expendPack = (filePath, targetPath, whenDone, callback) ->
    switch os.platform!
        case 'win32'
            archiveWin32 filePath, targetPath, whenDone, callback
        case 'darwin'
            command = 1
        default
            command = 1

const addExternal = (cliConfigE, ghotiinstallE, expackPath) ->
    cliConfig = deepClone cliConfigE
    ghotiinstall = deepClone ghotiinstallE
    ghotiinstall.path = expackPath
    cliConfig.external.push ghotiinstall
    writeCLIConfig cliConfig

const excuteExternal = (ghoti_path, type, targetPath, whenDone, env, callback) ->
    const cliConfig = readCLIConfig!
    var external
    if cliConfig.external
    then 
        for i in cliConfig.external
        then 
            if i.name === type
            then 
                external = i
                log i
    else
        log '| ghoti config file is not exist in storage list'
        log '| Try to reinstall ghoti-cli by "sudo npm -g install ghoti-cli"'
        whenDone!
        process.exit!
    if external
    then
        log external
    else
        const { link, next } = parseLink type, whenDone
        switch next
            case 'download'
                # FOR PRODUCTION
                
                # const id = uniqueId!

                # FOR TESTING

                const id = '_5gbu4tisu'
                const downloadPath = path.join ghoti_path, 'external', (id + '.zip')
                const expendPath = path.join ghoti_path, 'external', id

                # FOR PRODUCTION

                # downloadPack link, downloadPath, ->
                #     log '--- DOWNLOAD COMPLETED ---'
                #     expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
                #         addExternal cliConfig, ghotiinstall, expendPath
                #         callback expendPath, ghotiinstall
                #     whenDone!

                # FOR TESTING

                expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
                    addExternal cliConfig, ghotiinstall, expendPath
            case 'file'
                log next
            default
                log '| Not a vaild link'
                whenDone!
                process.exit!
    void

const archiveWin32 = (filePath, targetPath, whenDone, callback) ->
    const unzip = spawn 'unzip', [
        '-o'
        filePath
        '-d'
        targetPath
    ]
    unzip.on 'exit', (code) ->
        if code === 0
        then 
            log '---  UNPACK COMPLETED  ---'
            (callback (JSON.parse (fs.readFileSync (path.join targetPath, '.ghotiinstall'), 'utf8')))
        else
            log '| Unzip failed'
            whenDone!
            process.exit!

export excuteExternal