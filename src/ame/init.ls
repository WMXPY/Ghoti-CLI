require! {
    '../log/std': { log, logPad }
    './underline': { mergeGhoti, calculateNewUpdate, calculateProgress, calculateNewMinus, calculateNewUnderlineSet, calculateNewUnderlinePlus }
    '../func/config': { getConfig, writeConfig }
    './checkGhoti': { checkGhoti }
}

const initUnderline = (ghoti, whenDone) ->
    const newGhoti = JSON.parse JSON.stringify ghoti
    if !(checkGhoti newGhoti)
    then 
        log '| Current enviorment is not a ghoti project'
        log '| Try "ghoti about"'
        whenDone!
        process.exit!
    newGhoti.underline.active = true
    newGhoti.underline.path = []
    writeConfig newGhoti
    void

export initUnderline