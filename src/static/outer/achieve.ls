require! {
    path
    fs
    os
    'child_process': { spawn }
    '../../func/config': { writeCLIConfig, readCLIConfig }
    '../../log/std': { log, logPad }
    '../../func/deepclone': { deepClone, uniqueId }
    './download': { downloadFile }
    '../../func/fs/fileController': { readFileC }
}

const downloadPack = (uri, filename, callback) ->
    downloadFile uri, filename, (err) ->
        if err
        then 
            log '| Err ' + err.toString!
            process.exit!
        else callback!
    void

const parseLink = (linkE, whenDone) ->
    const splited = linkE.split /:\/\/|\//g
    if splited.length <= 0
    then
        log '| Not a valid link'
        whenDone!
        process.exit!
    const protocol = (splited.shift!).toLowerCase!
    var link, next
    switch protocol
        case 'github'
            next = 'download'
            link = 'https://raw.githubusercontent.com/' + (splited.join '/')
        case 'http'
            fallthrough
        case 'https'
            next = 'download'
            link = linkE
        case 'file'
            next = 'file'
            link = linkE
        default
            log '| Not a valid link'
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
            archiveDarwin filePath, targetPath, whenDone, callback
        default
            archiveLinux filePath, targetPath, whenDone, callback

const addExternal = (cliConfigE, ghotiinstallE, expackPath, whenDone) ->
    cliConfig = deepClone cliConfigE
    if cliConfig.external
    then 
        if cliConfig.external.length
        then 
            for i in cliConfig.external
            then 
                if i.name === ghotiinstallE.name
                then 
                    log '| ghotiinstall name already exist'
                    whenDone!
                    process.exit!
    else 
        log '| CLI config file is not valid'
        whenDone!
        process.exit!
    ghotiinstall = deepClone ghotiinstallE
    ghotiinstall.path = expackPath
    cliConfig.external.push ghotiinstall
    writeCLIConfig cliConfig

const addRemote = (cliConfigE, ghotiinstallE, expackPath, whenDone) ->
    cliConfig = deepClone cliConfigE
    if cliConfig.remote
    then 
        if cliConfig.remote.length
        then 
            for i in cliConfig.remote
            then 
                if i.name === ghotiinstallE.name
                then 
                    log '| ghotiinstall name already exist'
                    whenDone!
                    process.exit!
    else 
        log '| CLI config file is not valid'
        whenDone!
        process.exit!
    ghotiinstall = deepClone ghotiinstallE
    ghotiinstall.path = expackPath
    cliConfig.remote.push ghotiinstall
    writeCLIConfig cliConfig

const checkGhotiFile = (whenDone) ->
    const cliConfig = readCLIConfig!
    var external
    if cliConfig.external 
    && cliConfig.remote
    then
        # for i in cliConfig.external
        # then 
        #     if i.name === type
        #     then 
        #         external = i
        #         log i
    else
        log '| ghoti config file is not exist in storage list'
        log '| Try to reinstall ghoti-cli by "sudo npm -g install ghoti-cli"'
        whenDone!
        process.exit!
        void
    cliConfig

const executeSwitch = (ghoti_path, opit, targetPath, whenDone, env, callback) ->
    const cliConfig = checkGhotiFile whenDone
    const { link, next } = parseLink opit, whenDone
    switch next
        case 'download'
            
            const id = uniqueId!
            const downloadPath = path.join ghoti_path, 'external', 'cache', (id + '.zip')
            const expendPath = path.join ghoti_path, 'external', 'external', id

            downloadPack link, downloadPath, ->
                log '--- DOWNLOAD COMPLETED ---'
                log '| PACKAGE UNIQUEID: ' + id
                expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
                    if ghotiinstall.type === 'file'
                        addRemote cliConfig, ghotiinstall, expendPath, whenDone
                        callback expendPath, ghotiinstall
                    else if ghotiinstall.type === 'template'
                        addExternal cliConfig, ghotiinstall, expendPath, whenDone
                        callback expendPath, ghotiinstall
                    else
                        log '| External package is too old, this may not supported in future version'
                        addExternal cliConfig, ghotiinstall, expendPath, whenDone
                        callback expendPath, ghotiinstall
        case 'file'
            log next
        default
            log '| Not a valid link'
            whenDone!
            process.exit!
    void

const executeExternalFile = (ghoti_path, fileName, targetPath, whenDone, env, callback) ->
    const cliConfig = checkGhotiFile whenDone
    const { link, next } = parseLink fileName, whenDone
    switch next
        case 'download'
            # FOR PRODUCTION
            
            const id = uniqueId!

            # FOR TESTING

            # const id = '_5gbu4tisu'
            const downloadPath = path.join ghoti_path, 'external', 'cache', (id + '.zip')
            const expendPath = path.join ghoti_path, 'external', 'external', id

            # FOR PRODUCTION

            downloadPack link, downloadPath, ->
                log '--- DOWNLOAD COMPLETED ---'
                log '| PACKAGE UNIQUEID: ' + id
                expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
                    if ghotiinstall.type !== 'file'
                    then
                        log '| Expended Package is not a Ghoti Remote File'
                        whenDone!
                        process.exit!
                    addRemote cliConfig, ghotiinstall, expendPath, whenDone
                    callback expendPath, ghotiinstall

            # FOR TESTING

            # expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
            #     addExternal cliConfig, ghotiinstall, expendPath
            #     callback expendPath, ghotiinstall
                
        case 'file'
            log next
        default
            log '| Not a valid link'
            whenDone!
            process.exit!
    void

const executeExternal = (ghoti_path, type, targetPath, whenDone, env, callback) ->
    const cliConfig = checkGhotiFile whenDone
    const { link, next } = parseLink type, whenDone
    switch next
        case 'download'
            # FOR PRODUCTION
            
            const id = uniqueId!

            # FOR TESTING

            # const id = '_5gbu4tisu'
            const downloadPath = path.join ghoti_path, 'external', 'cache', (id + '.zip')
            const expendPath = path.join ghoti_path, 'external', 'external', id

            # FOR PRODUCTION

            downloadPack link, downloadPath, ->
                log '--- DOWNLOAD COMPLETED ---'
                log '| PACKAGE UNIQUEID: ' + id
                expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
                    if !ghotiinstall.type
                    then
                        log '| External package is too old, this may not supported in future version'
                    else if ghotiinstall.type !== 'template'
                    then
                        log '| Expended Package is not a Ghoti External Package'
                        whenDone!
                        process.exit!
                    addExternal cliConfig, ghotiinstall, expendPath, whenDone
                    callback expendPath, ghotiinstall

            # FOR TESTING

            # expendPack downloadPath, expendPath, whenDone, (ghotiinstall) ->
            #     addExternal cliConfig, ghotiinstall, expendPath
            #     callback expendPath, ghotiinstall
                
        case 'file'
            log next
        default
            log '| Not a valid link'
            whenDone!
            process.exit!
    void

const archiveLinux = (filePath, targetPath, whenDone, callback) ->
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
            var tempFilePath
            tempFilePath = path.join targetPath, '.ghotiinstall'
            if fs.existsSync tempFilePath
            then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
            else 
                tempFilePath = path.join targetPath, '.ghotiinstall.ghoti'
                if fs.existsSync tempFilePath
                then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
                else
                    log '| Target pack have no .ghotiinstall file'
                    whenDone!
                    process.exit!
        else
            log '| Unzip failed'
            log '--- Cleaning ---'
            whenDone!
            process.exit!

const archiveDarwin = (filePath, targetPath, whenDone, callback) ->
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
            var tempFilePath
            tempFilePath = path.join targetPath, '.ghotiinstall'
            if fs.existsSync tempFilePath
            then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
            else 
                tempFilePath = path.join targetPath, '.ghotiinstall.ghoti'
                if fs.existsSync tempFilePath
                then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
                else
                    log '| Target pack have no .ghotiinstall file'
                    whenDone!
                    process.exit!
        else
            log '| Unzip failed'
            whenDone!
            process.exit!

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
            var tempFilePath
            tempFilePath = path.join targetPath, '.ghotiinstall'
            if fs.existsSync tempFilePath
            then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
            else 
                tempFilePath = path.join targetPath, '.ghotiinstall.ghoti'
                if fs.existsSync tempFilePath
                then (callback (JSON.parse (readFileC tempFilePath, 'utf8')))
                else
                    log '| Target pack have no .ghotiinstall file'
                    whenDone!
                    process.exit!
        else
            log '| Unzip failed'
            whenDone!
            process.exit!

const unlinkFile = (filePath, whenDone) ->
    fs.unlinkSync filePath

export parseLink
export executeSwitch
export executeExternal
export executeExternalFile