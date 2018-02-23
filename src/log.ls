require! {
    './config': { version }
}

const log = (...text) -> 
    (console.log ...text)
    text

const logPad = (text, pad?) ->
    if pad
        for i to pad
            text = '  ' + text
    (log text)
    text

const br = ->
    (log '\r\n')

const logCommand = ->
    (log '🐟  > 👟  Ghoti-CLI:')

const logVersion = ->
    (log '🐟  > 📜  Ghoti-CLI Version: ' + version)
    process.exit!
    void

const logAbout = ->
    (log '🐟  > 📖  Ghoti-CLI About:')
    (logPad '| version : ' + version, 1)
    (logPad '| source  : https://github.com/WMXPY/Ghoti-CLI', 1)
    (logPad '| author  : WMXPY', 1)
    (logPad '| website : http://mengw.io', 1)
    process.exit!
    void

const logHelp = (isEmpty?) ->
    if isEmpty
    then (log '🐟  > 🏠  Ghoti-CLI Available commands:')
    else (log '🐟  > ⭐  Ghoti-CLI Available commands:')
    (logPad '| help      : show command list', 1)
    (logPad '| info      : show detail for a command', 1)
    (logPad '* example - ghoti info init', 2)
    (logPad '| init      : init a project', 1)
    (logPad '* example - ghoti init react your-awesome-project', 2)
    (logPad '| component : create a component', 1)
    (logPad '* example - ghoti component your-awesome-component', 2)
    (logPad '| about     : show about message', 1)
    (logPad '| version   : show current version', 1)
    process.exit!
    void

const logUnknown = ->
    (log '🐟  > 🙋  Ghoti-CLI Unknown command:')
    (logPad '| You just inputed a unknown command, try "Ghoti help" for command list', 1)
    process.exit!
    void

const logInfo = (command) ->
    if (Boolean command)
    then (log '🐟  > 📺  Ghoti-CLI Command information ' + command + ':')
    else (log 'Ghoti-CLI Error, info target is not available, try 'Ghoti info help'')
    switch(command)
        case 'about'
            (logPad '| Command   : show about message', 1)
            (logPad '* example   - ghoti about', 2)
        case 'version'
            (logPad '| Command   : show current version', 1)
            (logPad '* example   - ghoti version', 2)
        case 'info'
            (logPad '| Command   : show detail of a command', 1)
            (logPad '* example   - ghoti info init', 2)
            (logPad '* arguments - ghoti info [command]', 2)
        case 'init'
            (logPad '| Command   : init a project', 1)
            (logPad '* example   - ghoti init react your-awesome-project', 2)
            (logPad '* arguments - ghoti init [project type] [project name]', 2)
        case 'component'
            (logPad '| Command   : create a component', 1)
            (logPad '* example   - ghoti component your-awesome-component', 2)
            (logPad '* arguments - ghoti component [component name]', 2)
        case 'help'
            (logPad '| Command   : show command list', 1)
            (logPad '* example   - ghoti help', 2)
    process.exit!
    void

export log
export logHelp
export logInfo
export logAbout
export logCommand
export logVersion
export logUnknown
