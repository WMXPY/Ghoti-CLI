require! {
    '../log/std': { log, logPad }
    './underline': { mergeGhoti, calculateNewUpdate, calculateProgress, calculateNewMinus, calculateNewUnderlineSet, calculateNewUnderlinePlus }
    '../func/config': { getConfig, writeConfig }
    '../log/getInput': { getInput }
    './checkGhoti': { checkGhoti }
    '../func/deepclone': { deepClone }
}

const initUnderline = (ghoti, whenDone, env) !->
    const newGhoti = deepClone ghoti
    if !(checkGhoti newGhoti)
    then 
        log '| Current environment is not a ghoti project'
        log '| Try "ghoti about"'
        whenDone!
        process.exit!
    log '| Ghoti Underline is a awesome, light, sample progress tracking system'
    log '| here is some awesome example to use Ghoti Underline'
    log ' | "ghoti _"             for overall progress'
    log ' | "ghoti _[any]?"       for target status'
    log ' | "ghoti _#"            for new task set'
    log ' | "ghoti _[set name]+"  for new task'
    log ' | "ghoti _[task]-"      for complete a task'
    log ' | "ghoti _[task]!"      for update task status'
    log ''
    log '| Use a sentence as set or task name is welcome, but:'
    log '| you need use like "ghoti "_my sentence set+" some task"'
    log '| that quoted command name to modify it during usage'
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
        const fin = !->
            newGhoti.underline.active = true
            newGhoti.underline.path = []
            writeConfig newGhoti
            log '| ghoti underline is now setted up, have fun'
            log '| You can always use "ghoti _" to see overall progress'
            log '| To start your first step, Try "ghoti _# first-step"'
            log '| Add a task is as easy as, Try "ghoti _first-step+ my awesome first task" as your command'
        if env.yes
        then
            log '| -y argument is activated, skipping question.'
            log ''
            fin!
        else
            getInput 'Do you want to init GHOTI UNDERLINE in your project?', false, (wantToInit) !->
                if wantToInit
                then
                    fin!
                else
                    log '| thanks for considering ghoti underline'
                    log '| You can always use "ghoti underline" to active it in the future'
                whenDone!
    else
        log '| Have fun!'

export initUnderline
