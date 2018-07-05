require! {
    fs
    os
    path
    'child_process': { exec }
    '../log/std': { log, logPad }
}

const handleExec = (err, stdout, stderr, whenDone, callback) ->
    if err
    then
        log '| Error when zip files'
        whenDone!
        process.exit!
    if stderr
    then
        log '| Error in stderr'
        whenDone!
        process.exit!
    callback!

const packWin32 = (filePath, targetPath, whenDone, callback) ->
    var command
    command = 'cd ' + targetPath
    command += '&& zip ' + filePath + ' *'
    exec command, (err, stdout, stderr) ->
        handleExec err, stdout, stderr, whenDone, callback

const packDarwin = (filePath, targetPath, whenDone, callback) ->
    var command
    command = 'cd ' + targetPath
    command += '&& zip ' + filePath + ' *'
    exec command, (err, stdout, stderr) ->
        handleExec err, stdout, stderr, whenDone, callback

const packLinux = (filePath, targetPath, whenDone, callback) ->
    var command
    command = 'cd ' + targetPath
    command += '&& zip ' + filePath + ' *'
    exec command, (err, stdout, stderr) ->
        handleExec err, stdout, stderr, whenDone, callback

const pack = (targetPath, packName, ghoti, whenDone, env) ->
    const callback = ->
        log '| Pack completed'
        whenDone!
    const tPath = path.join process.cwd!, targetPath
    var pPath
    if (path.extname packName) === '.zip'
    then pPath = (path.join process.cwd!, packName)
    else pPath = (path.join process.cwd!, packName) + '.zip'
    switch os.platform!
        case 'win32'
            packWin32 pPath, tPath, whenDone, callback
        case 'darwin'
            packDarwin pPath, tPath, whenDone, callback
        default
            packLinux pPath, tPath, whenDone, callback

export pack