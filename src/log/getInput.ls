require! {
    readline
}

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
        (if typeof defaultText === 'boolean'
        then 
            (if answer === ''
            then answer = defaultText
            else
                (if answer === 'Y'
                then answer = true
                else if answer === 'N'
                then answer = false
                else
                then answer = false))
        else
            (if answer === ''
            then 
                (answer = defaultText)))
        (callback answer)
        void)
    void)

export getInput