require! {
    fs
    path
    './log': { log }
    readline
}

const parseGhoti = (text, index) ->
    text.replace 

const parseFile = (text, vars) -> 
    re = text
    for i of vars 
        switch(i)
            case 'title'
                re = (re.replace '${|title|}', vars.title)
            case 'description'
                re = (re.replace '${|description|}', vars.description)
            case 'author'
                re = (re.replace '${|author|}', vars.author)
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
                (callback (parseAllIn textList, vars))
                void)
            void)
        void)
    textList

export parseFile
export parseAll