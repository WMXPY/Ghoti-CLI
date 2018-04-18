require! {
    fs
    path
}

const readFileC = (filePath, whenDone?) ->
    if fs.existsSync filePath
    then return fs.readFileSync filePath, 'utf8'
    else 
        if whenDone
        then whenDone!
        else log '! File Read Error while reading "' + filePath + '"'
        process.exit!

export readFileC
