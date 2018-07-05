require! {
    fs
    http
    https
}

const downloadFile = (url, targetPath, callback) ->
    var httpClient
    if (url.substring 0, 5) === 'https'
    then httpClient = https
    else httpClient = http

    const writeStream = fs.createWriteStream targetPath
    writeStream.on 'finish', ->
        writeStream.close callback
        void
    writeStream.on 'error', (err) ->
        writeStream.close!
        callback err
        void
    const request = httpClient.get url, (response) ->
        response.pipe writeStream
        void
    request.on 'error', (err) ->
        fs.unlink targetPath
        if callback
        then callback err.message
        void
    void

export downloadFile
