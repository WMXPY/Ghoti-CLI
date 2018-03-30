require! {
    fs
    path
    '../log/std': { log }
    '../static/file': { libFile }
    './parser': { commonParse, commonGather }
}

(const switchRoot = (type, ghoti_root) ->
    (const re = (libFile type, ghoti_root))
    (if re
    then re
    else null))

const readFile = (root, vars) ->
    commonParse (fs.readFileSync root, 'utf8'), vars

(const writeFile = (root, data) -> 
    (if (root.substring root.length - 6, root.length) === '.ghoti'
    then (fs.writeFileSync (root.substring 0, root.length - 6), data, 'utf8')
    else (fs.writeFileSync root, data, 'utf8')))

const getFileRoot = (filePath, fileName, ghoti_root) ->
    path.join ghoti_root, 'lib', 'files', filePath, fileName

const file = (ghoti_root, fileName, targetPathE, whenDone, env) ->
    var targetPath
    if !targetPathE
    then targetPath = process.cwd!
    else targetPath = targetPathE
    const root = (switchRoot fileName, ghoti_root)
    if !Boolean root
    then
        (log ' | file "' + fileName + '" is not a valid file name')
        (log ' | Try "ghoti files" for the list of valid files')
        (whenDone!)
        (process.exit!)
    else 
        commonGather root.replaces, (vars) ->
            if env.rename
            then
                commonGather ['rename'], (rename) ->
                    const targetName = rename[0].value
                    writeFile (path.join targetPath, targetName), (readFile (getFileRoot root.path, root.file,ghoti_root), vars)
                    log '| File copied'
                    whenDone!
            else
                writeFile (path.join targetPath, root.file), (readFile (getFileRoot root.path, root.file,ghoti_root), vars)
                log '| File copied'
                whenDone!
    void

export file