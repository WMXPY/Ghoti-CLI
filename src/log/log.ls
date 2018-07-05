require! {
    '../static/static': { version }
    '../func/whatis': { whatis, postInstall }
    '../static/lib': { lib, libList }
    '../static/file': { libFileList }
    './logTable': { logTable }
    './std': { log, logPad, logInline }
    '../static/commands': { getCommand, allCommands, padRight, getMaxLength_List, getMaxLength_Plus, getMaxLength_Entire }
}

const faces = [
    '( ͡° ͜ʖ ͡°)'
    '(੭ु≧▽≦)੭ु'
    '╰( ᐖ╰)≡(╯ᐛ )╯'
    '.(｡￫‿￩｡)'
    'ఠ_ఠ'
    'ಸ_ಸ'
    '눈_눈'
    '(๑>◡<๑)'
    '┌(ㆆ㉨ㆆ)ʃ'
    '(´≖◞౪◟≖)'
    '(ಥ_ಥ)'
    '(❁´▽`❁)'
    '(ง •̀_•́)ง┻━┻'
    '┬─┬ノ(\'-\'ノ)'
    ' (´・ω・｀)'
]

(const logSeprate = (length) ->
    (var re)
    (re = '')

    # FIX 2018-04-20
    # was for i to length, due to ls feature, change to i to length - 1
    (for i to length - 1
        re += '-')
    (log re)
    re)

(const getMaxLength = (list) ->
    (var len)
    (len = 0)
    (for i in list
        (if i.length >= len
        then len = i.length))
    len)

const br = !->
    (log '\r\n')

(const logFace = ->
    (const ran = Math.floor ((Math.random! * (faces.length * 500)) % faces.length))
    (log faces[ran])
    faces[ran])

const logAlias = (command, original) !->
    (log 'Tips: "ghoti ' + command + '" is an alia of "ghoti ' + original + '"')

const logCommand = (command?, original?) ->
    (const title = '🐟  > 👟  Ghoti-CLI:')
    (log title)
    (if ((Boolean command) && (Boolean original))
    then (logAlias command, original))
    (logSeprate title.length) 
    !->
        (logSeprate title.length)
        (logFace!)

const logSymbol = (mark, path?) ->
    var title
    if path
    then (title = '🐟  > 💫  Ghoti-CLI SYMBOL ' + mark + ' of "' + path + '":')
    else (title = '🐟  > 💫  Ghoti-CLI SYMBOL ' + mark + ':')
    (log title)
    (logSeprate title.length) 
    !->
        (logSeprate title.length)
        (logFace!)

const logVersion = (env?) !->
    (const title = '🐟  > 📜  Ghoti-CLI Version:')
    (log title)
    (logSeprate title.length)
    (logPad '| version : ' + version, 1)
    (logPad '* try to update > npm install -g ghoti-cli', 2)
    (logPad '| info    : for more info, try "ghoti help"', 1)
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logStatus = (ghoti, env?) !->
    (const title = '🐟  > 📇  Ghoti-CLI Status:')
    (log title)
    (logSeprate title.length)
    (if (
    (!(Boolean ghoti.template))
    || (!(Boolean ghoti.author))
    || (!(Boolean ghoti.description))
    || (!(Boolean ghoti.version))
    || (!(Boolean ghoti.title))
    || (!(Boolean ghoti.components))
    || (!(Boolean ghoti.pages))
    || (!(Boolean ghoti.funcs))
    || (!(Boolean ghoti.lambdas)))
        (logPad '| ERROR, ghoti have no at least one required configeration', 1)
        (logPad '| Try to fix it: "ghoti fix"', 1)
        (logSeprate title.length)
        (logFace!)
        (process.exit!))
    (logPad '| Info        : status is came from .ghoticonfig file', 1)
    (logPad '| Template    : ' + ghoti.template, 1)
    (logPad '| Author      : ' + ghoti.author, 1)
    (logPad '| Descript    : ' + ghoti.description, 1)
    (logPad '| CLI Version : ' + ghoti.version, 1)
    (logPad '| Title       : ' + ghoti.title, 1)
    (logPad '| Components  : availble count - ' + ghoti.components.length, 1)
    (for i in ghoti.components
        (logPad '* component - ' + i, 2))
    (logPad '| Pages       : availble count - ' + ghoti.pages.length, 1)
    (for i in ghoti.pages
        (logPad '* page      - ' + i, 2))
    (logPad '| Functions   : availble count - ' + ghoti.funcs.length, 1)
    (for i in ghoti.funcs
        (logPad '* function  - ' + i, 2))
    (logPad '| Lambdas     : availble count - ' + ghoti.lambdas.length, 1)
    (for i in ghoti.lambdas
        (logPad '* lambda    - ' + i, 2))
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logAbout = (env?) !->
    (const title = '🐟  > 📖  Ghoti-CLI About:')
    (log title)
    (logSeprate title.length)
    (logPad '| source  : //github.com/WMXPY/Ghoti-CLI', 1)
    (logPad '| author  : WMXPY', 1)
    (logPad '| version : ' + version, 1)
    (logPad '| license : CC-BY-SA', 1)
    (logPad '| website : //mengw.io', 1)
    (logPad '| contact : wm@mengw.io', 1)
    (logSeprate title.length)
    (logFace!)
    (process.exit!)
    void

const logUnderline = ->
    (const title = '🐟  > 🎆  Ghoti-CLI GHOTI UNDERLINE:')
    (log title)
    (logSeprate title.length)
    !->
        (logSeprate title.length)
        (logFace!)
        (process.exit!)

const logGame = ->
    (const title = '🐟  > 🎲  Ghoti-CLI Minigame:')
    (log title)
    (logSeprate title.length)
    !->
        (logSeprate title.length)
        (logFace!)
        (process.exit!)

const logGameCommand = ->
    (const title = '🐟  > 🎮  Ghoti-CLI Minigame:')
    (log title)
    (logSeprate title.length) 
    !->
        (logSeprate title.length)
        (logFace!)

const logHelpMore = (env?) !->
    (const title ='🐟  > ⭐  Ghoti-CLI Available commands:')
    (log title)
    (logSeprate title.length)
    (const commands = ((allCommands!).map (it) ->
        (for i to it.arguments - 1
            it.command[0] += ' [ARG]')
        it))
    (const len = (getMaxLength_List commands))
    (commands.forEach (it) ->
        (logPad '| ' + (padRight it.command[0], len) + ': ' + it.info, 1)
        (for i in it.command
            if i !== it.command[0]
            then (logPad '* nickname - ' + i, 2))
        (for i in it.plus
            (logPad '* ' + i.name + '  - ' + i.value, 2)))
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logHelp = (isEmpty?, env?) !->
    (var title)
    (if isEmpty
    then (title = '🐟  > 🏠  Ghoti-CLI Available commands:')
    else (title = '🐟  > ⭐  Ghoti-CLI Available commands:'))
    (log title)
    (logSeprate title.length)
    (const commands = ((allCommands!).map (it) ->
        (for i to it.arguments - 1
            it.command[0] += ' *')
        it))
    (const len = (getMaxLength_List commands))
    (commands.forEach (it) ->
        (logPad '| ' + (padRight it.command[0], len) + ': ' + it.info, 1))
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logUnknown = (env?) !->
    (const title = '🐟  > 🙋  Ghoti-CLI Unknown command:')
    (log title)
    (logSeprate title.length)
    (logPad '| You just inputed a unknown command, try "ghoti help" for command list', 1)
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logInfo = (command, env?) !->
    (var title)
    (if (Boolean command)
    then title = '🐟  > 📺  Ghoti-CLI Command information ' + command + ':'
    else title = 'Ghoti-CLI Error, info target is not available, try "Ghoti info help"')
    (log title)
    (logSeprate title.length)
    (const t = (getCommand command))
    (const len = (getMaxLength_Entire t, 'Command', 'Function'))
    (logPad '| ' + (padRight 'Command', len) + ': ' + command, 1)
    (logPad '| ' + (padRight 'Function', len) + ': ' + t.info, 1)
    (for i in t.plus
        (logPad '| ' + (padRight i.name, len) + ': ' + i.value, 1))
    (for i in t.more
        (logPad '| ' + (padRight i.name, len) + ': ' + i.value, 1))
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logWhatIs = (keyword, env?) !->
    const title = '🐟  > 🏇🏼  Ghoti-CLI what is "' + keyword + '":'
    log title
    logSeprate title.length
    const whatisK = whatis keyword
    if whatisK
    then 
        logPad '| "' + keyword + '" is: ', 1
        log ''
        whatisK.map (it) ->
            logPad '| ' + it, 1
    else logPad '| "' + keyword + '" is not in ghoti database', 1
    logSeprate title.length
    logFace!
    process.exit!

const logPostNPMInstall = (type, env?) !->
    (const title = '🐟  > 🦉  Ghoti-CLI information "' + type + '":')
    (log title)
    (logSeprate title.length)
    (const postInstallK = (postInstall type))
    (if postInstallK
    then (postInstallK.map (it) ->
        (switch it
            case '$empty'
                (log '')
            default
                (logPad '| ' + it, 1)))
    else (logPad '| "' + type + '" is not a exist ghoti init type' , 1))
    (logSeprate title.length)
    (logFace!)
    (process.exit!)

const logUpdate = (ghoti, env?) ->
    (const title = '🐟  > 🦉  Ghoti-CLI update:')
    (log title)
    (logSeprate title.length)
    (logPad '| Auto update fature is indevlopment', 1)
    (logPad '| To update ghoti version manually, follow the document on Github', 1)
    (logPad '| Try: "ghoti about"', 1)
    !->
        (logSeprate title.length)
        (logFace!)

const logListPlus = !->
    (const re = (libList!))
    (const title = '🐟  > 📇  Ghoti-CLI List:')
    (log title)   
    (log 'You can use "ghoti whatis [name]" for more information!') 
    (const table = re.map (it) ->
        ([
            it.name
            it.language
            it.framework
            it.location
            it.author
        ]))
    (logTable table, 'type', 'language', 'framework', 'location', 'author')
    log '| For external packages, view https://github.com/WMXPY/Ghoti-CLI/blob/master/doc/ghoti/list.md'
    (logFace!)
    (process.exit!)

const logList = !->
    (const re = (libList!))
    (const title = '🐟  > 📇  Ghoti-CLI List:')
    (log title)   
    (log 'You can use "ghoti whatis [name]" for more information!') 
    (const table = re.map (it) ->
        ([
            it.name
            it.location
            it.author
        ]))
    (logTable table, 'type', 'location', 'author')
    log '| For external packages, view https://github.com/WMXPY/Ghoti-CLI/blob/master/doc/ghoti/list.md'
    (logFace!)
    (process.exit!)

const logFileList = !->
    (const re = (libFileList!))
    (const title = '🐟  > 📇  Ghoti-CLI File List:')
    (log title)   
    (log 'You can use "ghoti whatis [name]" for more information!') 
    (const table = re.map (it) ->
        ([
            it.name
            it.location
            it.author
        ]))
    (logTable table, 'file', 'location', 'author')
    (logFace!)
    (process.exit!)

const logPostInstall = (targetPath, type, typescript, env?) !->
    switch type
        case 'feature'
            (log '')
            (logPad 'Congratulations!!! 😎', 1)
            (log '')
        default
            (log '')
            (logPad 'Congratulations!!! 😎', 1)
            (log '')
            (logPad '| All needed files are configed and "almost" ready to go!', 1)
            (logPad '| JUST A FEW MORE STEP: ', 1)
            (log '')
            (logPad '* cd ' + targetPath, 2)
            (logPad '* npm install', 2)
            (if typescript
                (logPad '* npm link typescript', 2)
                (logPad '! version of typescript must be >= 2.7.0', 2))
            (log '')
            (logPad '| Thats all, have fun', 1)
            (logPad '| You will see how to modify, develop, and build your project after install', 1)
            (logPad '| You can also always checkout those information by use following methods', 1)
            (logPad '* run "ghoti post ' + type + '" anywhere', 2)
            (logPad '* run "npm run hint" in your project folder', 2)
            (logPad '| TIPS: How to init a git repo, try:', 1)
            (logPad '* ghoti whatis git-init', 2)

const logDeprecated = (command, due) ->
    log '| Command "' + command + '" is no longer suppored due to:'
    due.forEach (it) ->
        logPad ('| ' + it), 1

const logTilde = ->
    const title = '🐟  > 📟  Ghoti-CLI Tilde:'
    log title
    logSeprate title.length
    !->
        logSeprate title.length
        logFace!
        process.exit!

export log
export br
export logAlias
export logSeprate
export getMaxLength
export logFace
export faces
export logInline
export logPad
export logHelp
export logHelpMore
export logInfo
export logAbout
export logUnderline
export logStatus
export logCommand
export logSymbol
export logVersion
export logUnknown
export logPostInstall
export logPostNPMInstall
export logWhatIs
export logUpdate
export logList
export logListPlus
export logFileList
export logGame
export logGameCommand
export logDeprecated
export logTilde
