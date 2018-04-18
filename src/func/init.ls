require! {
    fs
    path
    '../log/log': { log, logPostInstall }
    './parser/parser': { parseAll, parseFile, commonGather }
    '../static/lib': { lib, commonPath, libCommons }
    '../static/outer/achive': { excuteExternal, excuteSwitch }
}

(const switchRoot = (type, ghoti_root) ->
    (const re = (lib type, ghoti_root))
    (if re
    then 
        log '| "' type + '" is a ' + re.location + ' ghoti-cli template.'
        re
    else null))

(const removeTail = (filename) ->
    (if (filename.substring filename.length - 6, filename.length) === '.ghoti'
    || (filename.substring filename.length - 6, filename.length) === '.ghotb'
    then (filename.substring 0, filename.length - 6)
    else filename))

(const copyToPathBinary = (targetPath, filePath, whenDone) ->
    (const fileReadStream = (fs.createReadStream filePath))
    (const fileWriteStream = (fs.createWriteStream (removeTail targetPath)))
    (fileReadStream.pipe fileWriteStream)
    (fileWriteStream.on 'error', ->
        (fileWriteStream.end!)
        (log '| Error on binary file copy')
        (log '| Try "ghoti fix binary file copy"')
        (whenDone!)
        (process.exit!))
    (fileReadStream.on 'error', ->
        (fileWriteStream.end!)
        (log '| Error on binary file copy')
        (log '| Try "ghoti fix binary file copy"')
        (whenDone!)
        (process.exit!))
    void)

(const copyToPath = (root, data, filename?) -> 
    if filename === '.ghotiinstall'
    then return
    (if (root.substring root.length - 6, root.length) === '.ghoti'
    then (fs.writeFileSync (root.substring 0, root.length - 6), data, 'utf8')
    else (fs.writeFileSync root, data, 'utf8')))
    
(const readFile = (filename, root, vars, specVars) ->
    (parseFile filename, (fs.readFileSync root, 'utf8'), vars, specVars))

(const makeDir = (root) ->
    (if (!(fs.existsSync root))
        (fs.mkdirSync root)))

(const logPath = (text, level) ->
    (var space)
    (space = '')
    (for to level
        space += ' |')
    (log space + text))

(const copyInitReacursion = (root, level, targetPath, beforeLength, vars, specVars, whenDone) ->
    (const files = (fs.readdirSync(root)))
    (const eachFile = (file) ->
        (const pathname = (path.join root, file))
        (const stat = (fs.lstatSync pathname))
        (const floatRoot = (root.substring beforeLength, root.length))
        (if ((stat.isDirectory)!)
            (logPath '- ' + (removeTail file), level)
            (makeDir (path.join targetPath, floatRoot, file))
            (copyInitReacursion pathname, level + 1, targetPath, beforeLength, vars, specVars, whenDone)
        else
            if (file.substring file.length - 6, file.length) === '.ghotb'
            then 
                (logPath '# ' + (removeTail file), level)
                copyToPathBinary (path.join targetPath, floatRoot, file), pathname, whenDone
            else 
                (logPath '* ' + (removeTail file), level)
                (copyToPath (path.join targetPath, floatRoot, file), (readFile file, pathname, vars, specVars), file)))
    (files.forEach eachFile))

(const copyInit = (type, targetPath, vars, specVars, root, whenDone) ->
    (const path_current = (process.cwd!))
    (makeDir (path.join path_current, targetPath))
    (copyInitReacursion root, 0, (path.join path_current, targetPath), root.length, vars, specVars, whenDone))

const downloadArchirve = (ghoti_root, type, targetPath, whenDone, env) ->
    excuteSwitch ghoti_root, type, targetPath, whenDone, env, (externalPath, ghotiinstall) ->
        log '| Finished.'
        log '| see "ghoti lt" & "ghoti lf" for new avaiable list'
        whenDone!
        void
    void

const readSpecialReplaces = (root, callback) ->
    commonGather root.replaces, (vars) ->
        callback vars

const readParseAll = (textList, targetPath, env, conff, callback) ->
    log '| @ Reading project information'
    parseAll textList, targetPath, env, (re, typesciprt) ->
        if conff.replaces
        then 
            log '| @ Reading special information'
            readSpecialReplaces conff, (newRe) ->
                callback re, newRe, typesciprt
        else
            log '| @ No special information'
            callback re, [], typesciprt

const initFromAchrive = (ghoti_root, type, targetPath, whenDone, env) ->
    excuteExternal ghoti_root, type, targetPath, whenDone, env, (externalPath, ghotiinstall) ->
        readParseAll type, targetPath, env, ghotiinstall, (re, newRe, typesciprt) ->
            (log ' | @ Copying lib files')
            (copyInit type, targetPath, re, newRe, externalPath)
            (log ' | @ Copying common files')
            (var count)
            (const common = libCommons ghotiinstall.common, ghoti_root)
            (count = 0)
            (if re.open
                (common.push (commonPath 'common', 'open-source', ghoti_root))
                (common.push (commonPath 'common', 'license', ghoti_root)))
            (for i in common
                (log ' | @ Common files chunk ' + count++)
                (copyInit type, targetPath, re, newRe, i))
            (whenDone!)
            void
        void
    void

(const init = (ghoti_root, type, targetPath, whenDone, env) ->
    (if (!targetPath)
        (log 'init have to use format "ghoti init [type] [path]"')
        (log 'type could be any typename in list "ghoti list" or "ghoti lt"')
        (log 'Try: "ghoti info init"')
        whenDone!
        (process.exit!))
    if env.fetch
    then 
        initFromAchrive ghoti_root, type, targetPath, whenDone, env
    else
        (const root = (switchRoot type, ghoti_root))
        (if (!(Boolean root))
        then 
            (log ' | type "' + type + '" is not a valid type of ghoti type')
            (log ' | Try "ghoti list" or "ghoti lt" for the list of valid types')
            (whenDone!)
            (process.exit!))
        (readParseAll type, targetPath, env, root, (re, newRe, typesciprt) ->
            (log ' | @ Copying lib files')
            (copyInit type, targetPath, re, newRe, root.path)
            (log ' | @ Copying common files')
            (var count)
            (const common = [...root.common])
            (count = 0)
            (if re.open
                (common.push (commonPath 'common', 'open-source', ghoti_root))
                (common.push (commonPath 'common', 'license', ghoti_root)))
            (for i in common
                (log ' | @ Common files chunk ' + count++)
                (copyInit type, targetPath, re, newRe, i))
            (logPostInstall targetPath, type, typesciprt)
            (whenDone!)
            void)
        void)

(export init)
export downloadArchirve