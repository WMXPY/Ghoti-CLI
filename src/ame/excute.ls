require! {
    '../log/std': { log, logPad }
    './underline': { mergeGhoti, checkAvailbility, calculateNewUpdate, calculateProgress, calculateNewMinus, calculateNewUnderlineSet, calculateNewUnderlinePlus }
    '../func/config': { getConfig, writeConfig }
}

const stopImmediatly = (whenDone) ->
    whenDone!
    process.exit!

const checkAme = (command) ->
    const first = command.substring 0, 1
    const other = command.substring 1, command.length
    if first === '_'
    then other.split('_')
    else null

const amePath = (other) ->
    other = JSON.parse JSON.stringify other
    var command
    if other[other.length - 1] === '+'
    || other[other.length - 1] === '#'
    || other[other.length - 1] === '-'
    || other[other.length - 1] === '?'
    || other[other.length - 1] === '!'
    then command = other.pop!
    else if other[other.length - 1] === ''
    then 
        other.pop!
        command = '?'
    else if (other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length) === '+'
    || (other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length) === '#'
    || (other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length) === '-'
    || (other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length) === '?'
    || (other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length) === '!'
    then 
        command = other[other.length - 1].substring other[other.length - 1].length - 1, other[other.length - 1].length
        other[other.length - 1] = other[other.length - 1].substring 0, other[other.length - 1].length - 1
    else 
        command = '?'
    {
        command
        other
    }

const ameActive = (logSymbol) ->
    const whenDone = logSymbol '~~~'
    logPad '| Underline is not actived yet', 1
    logPad '| Know more about GHOTI UNDERLINE, and activate it', 1
    logPad '| Try "ghoti underline" in your project', 1
    whenDone!
    process.exit!

const accessPath = (path, ame, whenDone) ->
    var re, stat
    re = JSON.parse JSON.stringify ame
    stat = false
    for i in path
        if re.child
        then re = re.child
        for j in re
            if j.name === i
            then 
                re = j
                stat = true
                break
        if !stat
        then 
            logPad '| "' + i + '" is not a valid path'
            whenDone!
            process.exit!
        else stat = false
    re

const ameUpdate = (path, contexts, ghoti, whenDone) ->
    contexts = JSON.parse JSON.stringify contexts
    const setting = contexts.shift!
    const context = contexts.join ' '
    const ame = ghoti.underline.path
    const current = accessPath path, ame, whenDone
    const re = calculateNewUpdate current, setting, context, whenDone
    const newGhoti = mergeGhoti ghoti, path, re, whenDone
    writeConfig newGhoti
    void

const ameSet = (path, context, ghoti, whenDone) ->
    const ame = ghoti.underline.path
    const current = accessPath path, ame, whenDone
    if checkAvailbility current, context
    then
        const re = calculateNewUnderlineSet current, context, whenDone
        const newGhoti = mergeGhoti ghoti, path, re, whenDone
        writeConfig newGhoti
    else
        log '| Input is not valid'
        stopImmediatly(whenDone)
    void

const amePlus = (path, context, ghoti, whenDone) ->
    const ame = ghoti.underline.path
    const current = accessPath path, ame, whenDone
    if checkAvailbility current, context
    then
        const re = calculateNewUnderlinePlus current, context, whenDone
        const newGhoti = mergeGhoti ghoti, path, re, whenDone
        writeConfig newGhoti
    else
        log '| Input is not valid'
        stopImmediatly(whenDone)
    void

const ameMinus = (path, context, ghoti, whenDone) ->
    const ame = ghoti.underline.path
    const current = accessPath path, ame, whenDone
    const re = calculateNewMinus current, context, whenDone
    const newGhoti = mergeGhoti ghoti, path, re, whenDone
    writeConfig newGhoti
    void

const ameStatus = (path, context, ghoti, whenDone) ->
    const ame = ghoti.underline.path
    const current = accessPath path, ame, whenDone
    const { total, amount } = calculateProgress current, whenDone, true
    if total === 0
    then
        log '| No task to show is target path'
    else
        log '| Total Tasks      : ' + total
        log '| Overall Progress : ' + ((amount / total).toFixed 2) + '%'


const excuteAme = (oriOther, contexts, ghoti, logSymbol, env, ghotiCLIPath, targetPath) ->
    var whenDone
    if !ghoti.underline.active
    then ameActive logSymbol
    const { command, other } = amePath oriOther
    whenDone = logSymbol command, other[other.length - 1]
    const context = contexts.join ' '
    switch command
        case '?'
            ameStatus other, context, ghoti, whenDone
        case '#'
            ameSet other, context, ghoti, whenDone
        case '+'
            amePlus other, context, ghoti, whenDone
        case '-' 
            ameMinus other, context, ghoti, whenDone
        case '!'
            ameUpdate other, contexts, ghoti, whenDone
    whenDone!
    process.exit!
    void

export checkAme
export excuteAme