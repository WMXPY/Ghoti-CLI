require! {
    '../log/std': { log, logPad }
}

const checkAme = (command) ->
    const first = command.substring 0, 1
    const other = command.substring 1, command.length
    if first === '_'
    then other.split('_')
    else null

const amePath = (other) ->
    var command
    if other[other.length - 1] === '+'
    || other[other.length - 1] === '-'
    || other[other.length - 1] === '?'
    then command = other.pop!
    else command = '?'
    command

const ameActive = (logSymbol) ->
    const whenDone = logSymbol '~~~'
    logPad '| Underline is not actived yet', 1
    logPad '| Know more about GHOTI UNDERLINE, and activate it', 1
    logPad '| Try "ghoti underline" in your project', 1
    whenDone!
    process.exit!

const amePlus = (path, context) ->
    log path
    log context

const ameMinus = (path, context) ->
    log path
    log context

const ameStatus = (path, context) ->
    log path
    log context

const excuteAme = (other, contexts, ghoti, logSymbol, env, ghotiCLIPath, targetPath) ->
    var whenDone
    if !ghoti.underline.active
    then ameActive logSymbol
    const command = amePath other
    whenDone = logSymbol command
    const context = contexts.join ' '
    switch command
        case '?'
            ameStatus other, context
        case '+'
            amePlus other, context
        case '-' 
            ameMinus other, context
    whenDone!
    process.exit!
    void

export checkAme
export excuteAme