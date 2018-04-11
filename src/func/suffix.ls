require! {
    fs
    path
    '../log/std': { log, logPad }
    './folder': { eachFolder, makeDir }
}

const changeSuffix = (path) ->
    const splited = filePath.split /\\|\//g
    const lastS = splited[splited.length - 1].split '.'
    if lastS.length <= 1
    then splited[splited.length - 1] = lastS.join '.'
    else 
        lastS[lastS.length - 1] = 'ghoti'
        splited[splited.length - 1] = lastS.join '.'
    splited

const suffix = (targetPath, distPath, ghoti, whenDone, env) ->
    const tPath = path.join process.cwd!, targetPath
    const dPath = path.join process.cwd!, distPath
    makeDir dPath
    const fileHandler = (filePath, level) ->
        log 'file ' + filePath
        const splited = filePath.split /\\|\//g
        const disted = path.join dPath, ...(splited.slice (splited.length - level - 1), splited.length)
        const fileContent = fs.readFileSync filePath
        fs.writeFileSync (disted + '.ghoti'), fileContent, 'utf8'
    const folderHandler = (folderPath, level) -> 
        log 'folder ' + folderPath
        const splited = folderPath.split /\\|\//g
        const disted = path.join dPath, ...(splited.slice (splited.length - level - 1), splited.length)
        makeDir disted
    eachFolder tPath, folderHandler, fileHandler

export suffix