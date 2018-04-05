require! {
    fs
    path
    '../log/log': { log, logInline }
    '../static/static': { version }
    '../func/deepclone': { deepClone }
    '../log/getInput': { getInput }
    'child_process': { exec }
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
    const question = 'Gathering replace parameter "' + current + '" :\n=>> '
    
    rl.question question, (answer) ->
        rl.close!
        re.push {
            name: current
            value: answer
        }
        if list.length > 0
        then commonGather list, done, re
        else done re
    void

(const parseFile = (filename, text, vars, typescript?) -> 
    (var re)
    (re = text)
    (re = (re.replace /\${\|version\|}/g, version))
    (if (filename === 'package.json.ghoti')
    || (filename === 'README.md.ghoti')
        (if typescript
        then re = (re.replace /\${\|typescript\|}/g, '"typescript": "^2.7.2",')
        else re = (re.replace /\${\|typescript\|}/g, ''))
        (if vars.open
        then
            re = (re.replace /\${\|private\|}/g, 'false')
            re = (re.replace /\${\|readme\|}/g, '\n<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">Creative Commons Attribution-ShareAlike 4.0 International License</a>.\n')
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
