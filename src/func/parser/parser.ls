require! {
    fs
    path
    '../../log/log': { log, logInline }
    '../../static/static': { version }
    '../../func/deepclone': { deepClone }
    '../../log/getInput': { getInput }
    'child_process': { exec }
    './comments': { parseComments }
    readline
}

const processMucall = (env, mucall) ->
    env = deepClone env
    # Update 2018-04-02
    # deepclone array object before shift it
    mucall = deepClone mucall
    const mode = mucall.shift!
    env.mode = mode
    for i of mucall
        if i.substring 0, 1 !== '-'
        then env.texture.push i
        else log i
    env

(const checkTypescript = (callback) ->
    (const child = (exec 'tsc -v', (err, stdout, stderr) ->
        (if err
        then callback false
        else callback true)
        void
    ))
    void)

const commonParse = (content, vars) ->
    var re
    re = content
    for i in vars
        const reg = new RegExp '\\${\\|' + i.name + '\\|}', 'g'
        re = re.replace reg, i.value
    re

const commonParseArray = (content, vars) ->
    var re
    re = content
    for i in vars
        const reg = new RegExp '\\${\\|' + i.name + '\\|}', 'g'
        re = re.replace reg, i.value
    re

const commonGather = (list, done, second?) ->
    var re
    if !second
    then re = []
    else re = second

    if list.length <= 0
    then 
        done []
        return

    (const intf = 
        input: process.stdin
        output: process.stdout
        terminal: false)

    (const rl = (readline.createInterface intf))

    const current = list.shift!
    var currentName, question, type, defaultValue, defaultStr
    if typeof current === 'string'
    then 
        currentName = current
        type = 'string'
        defaultValue = ''
    else 
        currentName = current.name
        type = current.type
        defaultValue = current.default

    switch type
        case 'boolean'
            if defaultValue
            then defaultStr = 'default: Y'
            else defaultStr = 'default: N'
            question = 'Gathering replace parameter "' + currentName + '" (Y/N, ' + defaultStr + ') :\r\n=>> '
        case 'string'
            fallthrough
        default
            if defaultValue
            then question = 'Gathering replace parameter "' + currentName + '" (default: ' + defaultValue + ') :\r\n=>> '
            else question = 'Gathering replace parameter "' + currentName + '" :\r\n=>> '

    rl.question question, (answer) ->
        rl.close!
        var result

        switch type
        case 'boolean'
            if answer === ''
            then result = defaultValue
            else if answer === 'Y'
            then result = true
            else result = false
        case 'string'
            fallthrough
        default
            if answer === ''
            then result = defaultValue
            else result = answer

        re.push {
            name: currentName
            value: result
        }
        if list.length > 0
        then commonGather list, done, re
        else done re
        void

    void

(const parseFile = (filename, text, vars, specVars, typescript?) -> 
    (var re)
    (re = text)
    re = parseComments filename, text, vars
    (re = (re.replace /\${\|version\|}/g, version))
    (if (filename === 'package.json.ghoti')
    || (filename === 'README.md.ghoti')
        (if typescript
        then re = (re.replace /\${\|typescript\|}/g, '"typescript": "^2.7.2",')
        else re = (re.replace /\${\|typescript\|}/g, ''))
        (if vars.open
        then
            re = (re.replace /\${\|private\|}/g, 'false')
            re = (re.replace /\${\|readme\|}/g, '\r\n<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.\r\n')
            re = (re.replace /\${\|license\|}/g, 'SEE LICENSE IN LICENSE')
        else
            re = (re.replace /\${\|private\|}/g, 'true')
            re = (re.replace /\${\|readme\|}/g, '')
            re = (re.replace /\${\|license\|}/g, 'PRIVATE')))
    (for i of vars 
        (switch(i)
            case 'title'
                re = (re.replace /\${\|title\|}/g, vars.title)
            case 'description'
                re = (re.replace /\${\|description\|}/g, vars.description)
            case 'author'
                re = (re.replace /\${\|author\|}/g, vars.author)))
    re = commonParse re, specVars
    re)

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

export processMucall
export parseFile
export commonParse
export commonGather
export parseAll
export checkTypescript
