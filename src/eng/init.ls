require! {
    '../log/std': { log, logPad, logReplace }
    '../func/deepclone': { deepClone }
    '../ame/checkGhoti': { checkGhoti }
    '../log/getInput': { getInput }
}

const minigame = (ghotiE, env, whenDone) ->
    const ghoti = deepClone ghotiE
    if !(checkGhoti ghoti)
    then 
        log '| Current enviorment is not a ghoti project'
        log '| Try "ghoti about"'
        whenDone!
        process.exit!
    log '| Ghoti Game is a light game engine in terminal'
    log '| Relax when you are confusing on anything stupid!'
    log '| Try the following command to enter the game'
    log ' | "ghoti !"   for start game engine'
    log ''
    if !Boolean ghoti.game
    then
        log '| This project is not inited game engine yet'
        getInput 'Do you want to init GHOTI GAME in your project?', false, (wantToInit) ->
            log wantToInit
            whenDone!

export minigame