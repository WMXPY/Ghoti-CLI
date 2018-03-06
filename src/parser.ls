require! {
    fs
    path
    './log': { log, logInline }
    './static/static': { version }
    'child_process': { exec }
    readline
}

(const checkTypescript = (callback) ->
    (const child = (exec 'tsc -v', (err, stdout, stderr) ->
        (if err
        then callback false
        else callback true)
        void
    ))
    void)

(const parseFile = (filename, text, vars, typescript?) -> 
    (var re)
    (re = text)
    (re = (re.replace /\${\|version\|}/g, version))
    (if typescript
    then re = (re.replace /\${\|typescript\|}/g, '"typescript": "^2.7.2",')
    else re = (re.replace /\${\|typescript\|}/g, ''))
    (if (filename === 'package.json.ghoti')
        (if(vars.open)
            re = (re.replace /\${\|private\|}/g, 'false')
            re = (re.replace /\${\|license\|}/g, 'SEE LICENSE IN LICENSE')
        else
            re = (re.replace /\${\|private\|}/g, 'true')
            re = (re.replace /\${\|license\|}/g, 'PRIVATE')))
    (for i of vars 
        (switch(i)
            case 'title'
                re = (re.replace /\${\|title\|}/g, vars.title)
            case 'description'
                re = (re.replace /\${\|description\|}/g, vars.description)
            case 'author'
                re = (re.replace /\${\|author\|}/g, vars.author)))
    re)

(const getInput = (question, defaultText, callback) ->
    (const intf = 
        input: process.stdin
        output: process.stdout
        terminal: false)

    (const rl = (readline.createInterface intf))

    (if ((defaultText === true) || (defaultText === false))
    then
        (if defaultText
        then (question += ' (Y/N, default: Y)')
        else (question += ' (Y/N, default: N)'))
    else
        (if defaultText
        then (question += ' (default: ' + defaultText + ')')))
    
    (question += ' :\n=>> ')

    (rl.question question, (answer) ->
        (rl.close!)
        (if defaultText === true || defaultText === false
        then 
            (if answer === ''
            then answer = defaultText
            else
                (if answer === 'Y'
                then answer = true
                else if answer === 'N'
                then answer = false))
        else
            (if answer === ''
            then 
                (answer = defaultText)))
        (callback answer)
        void)
    void)

(const parseAllIn = (textList, vars) ->
    vars)
    # todo

(const parseAll = (textList, targetPath, env, callback) ->
    (checkTypescript (typescriptExist) ->
        (const vars = 
            title: ''
            description: ''
            author: ''
            open: false
            )
        (log '✒️  More about your awesome project~')
        (const titleQuestionText = 'Project Title')
        (getInput titleQuestionText, targetPath, (title)->
            (vars.title = title)
            (const descriptionQuestionText = 'Description of ' + vars.title)
            (getInput descriptionQuestionText, '', (description) ->
                (vars.description = description)
                (const authorQuestionText = 'Author of ' + vars.title)
                (getInput authorQuestionText, '', (author) ->
                    (vars.author = author)
                    (const openQuestionText = 'Is ' + vars.title + ' is an open source project?')
                    (getInput openQuestionText, false, (open) ->
                        (vars.open = open)
                        (callback (parseAllIn textList, vars), typescriptExist))
                    void)
                void)
            void)
        void))

export parseFile
export parseAll
export checkTypescript