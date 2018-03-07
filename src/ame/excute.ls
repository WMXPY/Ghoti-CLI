require! {
    '../log/std': { log }
}

const checkAme = (command) ->
    const first = command.substring 0, 1
    const other = command.substring 1, command.length
    if first === '_'
    then other.split('_')
    else null

const amePlus = (path, context) ->
    context

const ameMinus = (path, context) ->
    context

const ameStatus = (path, context) ->
    context

const excuteAme = (other, contexts, ghoti, logSymbol, env, ghotiCLIPath, targetPath) ->
    const path = []
    log other
    log contexts

export checkAme
export excuteAme