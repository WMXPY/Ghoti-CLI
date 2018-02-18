require! {
    fs
    path
    './log.ls': { log }
    readline
}

const parseGhoti = (text, index) ->
    text.replace 

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
    # todo

const parseAll = (textList, callback) ->
    const vars = 
        title: ''
        description: ''
        author: ''
    getInput 'title' (title)->
        vars.title = title
        getInput 'description' (description) ->
            vars.description = description
            getInput 'author' (author) ->
                vars.author = author
                callback parseAllIn textList, vars
                void
            void
        void
    textList

export parseAll