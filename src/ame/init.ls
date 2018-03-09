require! {
    '../log/std': { log, logPad }
    './underline': { mergeGhoti, calculateNewUpdate, calculateProgress, calculateNewMinus, calculateNewUnderlineSet, calculateNewUnderlinePlus }
    '../func/config': { getConfig, writeConfig }
    './checkGhoti': { checkGhoti }
}

const initUnderline = (ghoti) ->
    const newGhoti = JSON.parse JSON.stringify ghoti
    if !(checkGhoti newGhoti)
    then process.exit!
    newGhoti.underline.active = true
    newGhoti.underline.path = []
    void

export initUnderline