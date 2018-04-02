require! {
    path
    fs
    os
    child_process
}

const downloadPack = (packUrl) ->
    packUrl
    void

const expendPack = (targetPath) ->
    var command
    switch os.platform!
        case 'win32'
            command = 1
        case 'darwin'
            command = 1
        default
            command = 1
    child_process.exec(command)
    void