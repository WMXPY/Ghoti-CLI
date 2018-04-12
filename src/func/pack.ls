require! {
    fs
    os
    path
    'child_process': { spawn }
    '../log/std': { log, logPad }
}

const packWin32 = (filePath, targetPath, callback) ->
    log filePath, targetPath
    const zip = spawn 'zip', [
        '-r'
        filePath
        targetPath
    ]
    zip.on 'exit', callback

const packDarwin = (filePath, targetPath, callback) ->
    const zip = spawn 'zip', [
        '-r'
        filePath
        targetPath
    ]
    zip.on 'exit', callback

const packLinux = (filePath, targetPath, callback) ->
    const zip = spawn 'zip', [
        '-r'
        filePath
        targetPath
    ]
    zip.on 'exit', callback

const pack = (targetPath, packName, ghoti, whenDone, env) ->
    const callback = (code) ->
        log code
        whenDone!
    const tPath = path.join process.cwd!, targetPath, '*'
    const pPath = (path.join process.cwd!, packName) + '.zip'
    switch os.platform!
        case 'win32'
            packWin32 pPath, tPath, callback
        case 'darwin'
            packDarwin pPath, tPath, callback
        default
            packLinux pPath, tPath, callback

export pack