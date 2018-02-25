require! {
    './static': { version }
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

const logSeprate = (length) ->
    re = ''
    for i to length
        re += '-'
    (log re)
    re

const br = ->
    (log '\r\n')

const logFace = ->
    faces = ['( ͡° ͜ʖ ͡°)','(੭ु≧▽≦)੭ु','╰( ᐖ╰)≡(╯ᐛ )╯','.(｡￫‿￩｡)','ఠ_ఠ','ಸ_ಸ','(ಥ_ಥ)','(❁´▽`❁)','(ง •̀_•́)ง┻━┻','┬─┬ノ(\'-\'ノ)',' (´・ω・｀)']
    const ran = Math.floor ((Math.random! * (faces.length * 500)) % faces.length)
    log faces[ran]
    faces[ran]

const logAlias = (command, original) ->
    (log 'Tips: "ghoti ' + command + '" is an alia of "ghoti ' + original + '"')
    void

const logCommand = (command?, original?) ->
    const title = '🐟  > 👟  Ghoti-CLI:'
    (log title)
    if ((Boolean command) && (Boolean original))
    then (logAlias command, original)
    (logSeprate title.length)
    ->
        logSeprate title.length
        logFace!
        void

const logVersion = ->
    const title = '🐟  > 📜  Ghoti-CLI Version:'
    (log title)
    (logSeprate title.length)
    (logPad '| version : ' + version, 1)
    (logPad '| info    : for more info, try "ghoti help"', 1)
    (logSeprate title.length)
    (logFace!)
    process.exit!
    void

const logStatus = (ghoti) ->
    const title = '🐟  > 📇  Ghoti-CLI Status:'
    (log title)
    (logSeprate title.length)
    (logPad '| Info        : status is came from .ghoticonfig file', 1)
    (logPad '| Template    : ' + ghoti.template, 1)
    (logPad '| Author      : ' + ghoti.author, 1)
    (logPad '| Descript    : ' + ghoti.description, 1)
    (logPad '| CLI Version : ' + ghoti.version, 1)
    (logPad '| Title       : ' + ghoti.title, 1)
    (logPad '| Components  : availble count - ' + ghoti.components.length, 1)
    for i in ghoti.components
        (logPad '* component - ' + i, 2)
    (logPad '| Pages       : availble count - ' + ghoti.pages.length, 1)
    for i in ghoti.pages
        (logPad '* page      - ' + i, 2)
    (logPad '| Functions   : availble count - ' + ghoti.funcs.length, 1)
    for i in ghoti.funcs
        (logPad '* function  - ' + i, 2)
    (logPad '| Lambdas     : availble count - ' + ghoti.lambdas.length, 1)
    for i in ghoti.lambdas
        (logPad '* lambda    - ' + i, 2)
    (logSeprate title.length)
    (logFace!)
    process.exit!
    void

const logAbout = ->
    const title = '🐟  > 📖  Ghoti-CLI About:'
    (log title)
    (logSeprate title.length)
    (logPad '| source  : https://github.com/WMXPY/Ghoti-CLI', 1)
    (logPad '| author  : WMXPY', 1)
    (logPad '| version : ' + version, 1)
    (logPad '* try to update > npm install -g ghoti-cli', 2)
    (logPad '| website : http://mengw.io', 1)
    (logSeprate title.length)
    (logFace!)
    process.exit!
    void

const logHelp = (isEmpty?) ->
    var title
    if isEmpty
    then title = '🐟  > 🏠  Ghoti-CLI Available commands:'
    else title = '🐟  > ⭐  Ghoti-CLI Available commands:'
    (log title)
    (logSeprate title.length)
    (logPad '| help      : show command list', 1)
    (logPad '| status    : show status of current project', 1)
    (logPad '| info      : show detail for a command', 1)
    (logPad '* example - ghoti info init', 2)
    (logPad '| init      : init a project', 1)
    (logPad '* example - ghoti init react your-awesome-project', 2)
    (logPad '| component : create a component', 1)
    (logPad '* example - ghoti component your-awesome-component', 2)
    (logPad '| page      : create a page', 1)
    (logPad '* example - ghoti page your-awesome-page', 2)
    (logPad '| lambda    : create a lambda function set', 1)
    (logPad '* example - ghoti lambda your-awesome-function-name', 2)
    (logPad '| func      : create a function set', 1)
    (logPad '* example - ghoti func your-awesome-function-name', 2)
    (logPad '| about     : show about message', 1)
    (logPad '| version   : show current version', 1)
    (logSeprate title.length)
    (logFace!)
    process.exit!
    void

const logUnknown = ->
    const title = '🐟  > 🙋  Ghoti-CLI Unknown command:'
    (log title)
    (logSeprate title.length)
    (logPad '| You just inputed a unknown command, try "Ghoti help" for command list', 1)
    (logSeprate title.length)
    (logFace!)
    # process.exit!
    void

const logInfo = (command) ->
    var title
    if (Boolean command)
    then title = '🐟  > 📺  Ghoti-CLI Command information ' + command + ':'
    else title = 'Ghoti-CLI Error, info target is not available, try "Ghoti info help"'
    (log title)
    (logSeprate title.length)
    switch(command)
        case 'about'
            (logPad '| Command : show about message', 1)
            (logPad '* example   - ghoti about', 2)
        case 'version'
            (logPad '| Command : show current version', 1)
            (logPad '* example   - ghoti version', 2)
        case 'status'
            (logPad '| Command : show status of current project', 1)
            (logPad '* example   - ghoti status', 2)
        case 'info'
            (logPad '| Command : show detail of a command', 1)
            (logPad '* example   - ghoti info init', 2)
            (logPad '* arguments - ghoti info [command]', 2)
            (logPad '* command   - command could be any command name that ghoti available', 2)
        case 'init'
            (logPad '| Command : init a project', 1)
            (logPad '* example   - ghoti init react your-awesome-project', 2)
            (logPad '* arguments - ghoti init [project type] [project name]', 2)
            (logPad '* config    - you will be ask for "title", "author", "description" later', 2)
            (logPad '* type      - type could be "react", "react-ssr", "react-native", "vue" or "angular"', 2)
            (logPad '# react      > normal react project, also alias as "react-normal"', 3)
            (logPad '# react-lite > react project with ssr feature', 3)
            (logPad '# react-ssr  > lite react project with no lint and test feature', 3)
            (logPad '* name      - name could be anything you want for your project', 2)
        case 'page'
            (logPad '| Command : create a page', 1)
            (logPad '* example   - ghoti page your-awesome-page', 2)
            (logPad '* arguments - ghoti page [page name]', 2)
            (logPad '* name      - name could be any page name you want', 2)
        case 'func'
            (logPad '| Command : create a function set', 1)
            (logPad '* example   - ghoti func your-awesome-function-set', 2)
            (logPad '* arguments - ghoti func [set name]', 2)
            (logPad '* name      - name could be any set name you want', 2)
        case 'lambda'
            (logPad '| Command : create a lambda function set', 1)
            (logPad '* example   - ghoti lambda your-awesome-function-set', 2)
            (logPad '* arguments - ghoti lambda [set name]', 2)
            (logPad '* name      - name could be any set name you want', 2)
        case 'component'
            (logPad '| Command : create a component', 1)
            (logPad '* example   - ghoti component your-awesome-component', 2)
            (logPad '* arguments - ghoti component [component name]', 2)
            (logPad '* name      - name could be any component name you want', 2)
        case 'help'
            (logPad '| Command : show command list', 1)
            (logPad '* example   - ghoti help', 2)
        default
            (logPad '| Unknown command - "' + command + '"', 1)
            (logPad '| "ghoti ' + command + '" is not a functional command for ghoti', 1)
            (logPad '| for more info, try "ghoti help"', 1)
    (logSeprate title.length)
    (logFace!)
    process.exit!
    void

const logPostInstall = (targetPath, typescript) ->
    (log '')
    (logPad 'Congratulations!!! 😎', 1)
    (log '')
    (logPad '| All needed files are configed and "almost" ready to go!', 1)
    (logPad '| JUST A FEW MORE STEP: ', 1)
    (logPad '* cd ' + targetPath, 2)
    (logPad '* npm install', 2)
    if typescript
    then (logPad '* npm link typescript', 2)
    (logPad '| Thats all, have fun', 1)
    (logPad '* make       --> to start development', 2)
    (logPad '* make build --> to build project', 2)
    (logPad '* make tests --> to run unit tests', 2)
    (log '')

export log
export logHelp
export logInfo
export logAbout
export logStatus
export logCommand
export logVersion
export logUnknown
export logPostInstall