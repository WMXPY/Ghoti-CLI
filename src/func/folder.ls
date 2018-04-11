require! {
    fs
    path
}

(const makeDir = (root) ->
    (if (!(fs.existsSync root))
        (fs.mkdirSync root)))

const eachFolderReacursion = (root, level, folder, formula) ->
    const files = fs.readdirSync root
    const eachFile = (file) ->
        const pathname = path.join root, file
        const stat = fs.lstatSync pathname
        
        # flootROOT???

        if stat.isDirectory!
        then
            folder pathname, level
            eachFolderReacursion pathname, level + 1, folder, formula
        else
            formula pathname, level
    files.forEach eachFile


const eachFolder = (root, folder, formula) ->
    makeDir path.join root
    eachFolderReacursion root, 0, folder, formula

export makeDir
export eachFolder
