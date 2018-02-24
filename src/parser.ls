require! {
    fs
    path
    './log': { log }
    './static': { version }
    'child_process': { exec }
    readline
}

const checkTypescript = (callback) ->
    const child = (exec 'tsc -v', (err, stdout, stderr) ->
        if err
        then callback false
        else callback true
        void
    )
    void

const parseFile = (text, vars, typescript?) -> 
    re = text
    re = (re.replace /\${\|version\|}/g, version)
    if typescript
    then re = (re.replace /\${\|typescript\|}/g, '"typescript": "^2.7.2",')
    else re = (re.replace /\${\|typescript\|}/g, '')
    for i of vars 
        switch(i)
            case 'title'
                re = (re.replace /\${\|title\|}/g, vars.title)
            case 'description'
                re = (re.replace /\${\|description\|}/g, vars.description)
            case 'author'
                re = (re.replace /\${\|author\|}/g, vars.author)
    re

const getInput = (question, callback) ->
    const intf = 
        input: process.stdin
        output: process.stdout
        terminal: false

    const rl = readline.createInterface intf

    rl.question question, (answer) ->
        rl.close!
        callback answer
        void
    void

const parseAllIn = (textList, vars) ->
    vars
    # todo

const parseAll = (textList, callback) ->
    checkTypescript (typescriptExist) ->
        const vars = 
            title: ''
            description: ''
            author: ''
        (getInput 'Title: ' (title)->
            vars.title = title
            (getInput 'Description: ' (description) ->
                vars.description = description
                (getInput 'Author: ' (author) ->
                    vars.author = author
                    (callback (parseAllIn textList, vars), typescriptExist)
                    void)
                void)
            void)
        void

export parseFile
export parseAll
export checkTypescript