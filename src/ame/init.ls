require! {
    '../log/std': { log, logPad }
    './underline': { mergeGhoti, calculateNewUpdate, calculateProgress, calculateNewMinus, calculateNewUnderlineSet, calculateNewUnderlinePlus }
    '../func/config': { getConfig, writeConfig }
    './checkGhoti': { checkGhoti }
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

const initUnderline = (ghoti, whenDone) ->
    const newGhoti = JSON.parse JSON.stringify ghoti
    if !(checkGhoti newGhoti)
    then 
        log '| Current enviorment is not a ghoti project'
        log '| Try "ghoti about"'
        whenDone!
        process.exit!
    log '| Ghoit Underline is a awesome, light, sample progress tracking system'
    log '| here is some awesome example to use Ghoit Underline'
    log ' | "ghoti _"             for overall progress'
    log ' | "ghoti _#"            for new task set'
    log ' | "ghoti _[set name]+"  for new task'
    log ' | "ghoti _[task]-"      for complete a task'
    log ' | "ghoti _[task]_"      for update task status'
    log ''
    log '| Use a sentence as set or task name is welcome, but:'
    log '| you need use like "ghoti "_my sentence set+" some task"'
    log '| that quoted command name to modifiy it during usage'
    log ''
    if !newGhoti.underline
    then 
        log '| This folder is not a valid ghoti project'
        log '| If you think this is not your issue'
        log '| Try "ghoti fix" to fix this'
        whenDone!
        process.exit!
    if !newGhoti.underline.active
    then
        getInput 'Do you want to init GHOTI UNDERLINE in your project?', false, (wantToInit) ->
            if wantToInit
            then
                newGhoti.underline.active = true
                newGhoti.underline.path = []
                writeConfig newGhoti
                log '| ghoti underline is now setted up, have fun'
                log '| You can always use "ghoti _" to see overall progress'
                log '| To start your first step, Try "ghoti _# fisrt-step"'
                log '| Add a task is as easy as, Try "ghoti _fisrt-step+ my awesome fisrt task" as your command'
            else
                log '| thanks for concidering ghoti underline'
                log '| You can always use "ghoti underline" to active it in the future'
            whenDone!
    else
        log '| Have fun!'
    void

export initUnderline