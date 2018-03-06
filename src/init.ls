require! {
    fs
    path
    './log': { log, logPostInstall }
    './parser': { parseAll, parseFile }
    './lib': { lib, commonPath }
}

(const switchRoot = (type, ghoti_root) ->
    (const re = (lib type, ghoti_root))
    (if re
    then re
    else null))

(const removeTail = (filename) ->
    (if (filename.substring filename.length - 6, filename.length) === '.ghoti'
    then (filename.substring 0, filename.length - 6)
    else filename))

(const copyToPath = (root, data) -> 
    (if (root.substring root.length - 6, root.length) === '.ghoti'
    then (fs.writeFileSync (root.substring 0, root.length - 6), data, 'utf8')
    else (fs.writeFileSync root, data, 'utf8')))
    
(const readFile = (filename, root, vars) ->
    (parseFile filename, (fs.readFileSync root, 'utf8'), vars))

(const makeDir = (root) ->
    (if (!(fs.existsSync root))
        (fs.mkdirSync root)))

(const logPath = (text, level) ->
    (var space)
    (space = '')
    (for to level
        space += ' |')
    (log space + text))

(const copyInitReacursion = (root, level, targetPath, beforeLength, vars) ->
    (const files = (fs.readdirSync(root)))

    (const eachFile = (file) ->
        (const pathname = root + '/' + file)
        (const stat = (fs.lstatSync pathname))
        (const floatRoot = (root.substring beforeLength, root.length))

        (if ((stat.isDirectory)!)
            (logPath '- ' + (removeTail file), level)
            (makeDir (path.join targetPath, floatRoot, file))
            (copyInitReacursion root + '/' + file, level + 1, targetPath, beforeLength, vars)
        else
            (logPath '* ' + (removeTail file), level)
            (copyToPath (path.join targetPath, floatRoot, file), (readFile file, root + '/' + file, vars))))

    (files.forEach eachFile))

(const copyInit = (type, targetPath, vars, root) ->
    (const path_current = (process.cwd!))
    (makeDir (path.join path_current, targetPath))
    (copyInitReacursion root, 0, (path.join path_current, targetPath), root.length, vars))

(const init = (ghoti_root, type, targetPath, whenDone, env) ->
    (if (!targetPath)
        (log 'init have to use format "ghoti init [type] [path]"')
        (log 'type could be any typename in list "ghoti list"')
        (log 'Try: "ghoti info init"')
        (process.exit!))
    (const root = (switchRoot type, ghoti_root))
    (parseAll type, targetPath, env, (re, typesciprt) ->
        (log ' | @ Copying lib files')
        (copyInit type, targetPath, re, root.path)
        (log ' | @ Copying common files')
        (var count)
        (const common = [...root.common])
        (count = 0)
        (if re.open
            (common.push (commonPath 'license', ghoti_root)))
        (for i in common
            (log ' | @ Common files chunk ' + count++)
            (copyInit type, targetPath, re, i))
        (logPostInstall targetPath, type, typesciprt)
        (whenDone!)
        void))

export init