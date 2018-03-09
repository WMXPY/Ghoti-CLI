require! {
    path
    '../log/std': { log, logPad, logHalfPad }
    '../func/config': { getConfig, writeConfig }
}

const underline = (ghoti) ->
    ghoti

const puls = (name) ->
    name

const minus = (name) ->
    name

const mergeGhoti = (ghoti, pathE, re) ->
    const path = JSON.parse JSON.stringify pathE
    const newGhoti = JSON.parse JSON.stringify ghoti
    var subPath
    subPath = newGhoti.underline.path
    const endPath = path.pop!
    (if (!(Boolean endPath))
    then 
        (newGhoti.underline.path = re)
        return newGhoti)
    for i in path
        if subPath.child
        then for j in subPath.child
            if j.name === i
            then 
                subPath = j
                break
        else for j in subPath
            if j.name === i
            then 
                subPath = j
                break
    if subPath.child
    then for i to subPath.child.length - 1
        if subPath.child[i].name === endPath
        then subPath.child[i] = re
    else for i to subPath.length - 1
        if subPath[i].name === endPath
        then subPath[i] = re
    newGhoti

const whatIsCurrent = (current) ->
    switch current.type
        case 'set'
            'Ghoti underline SET'
        case 'task'
            'Ghoti underlint Task'
        default
            'Ghoti underline Root or not a underline path'

const calculateNewUpdate = (currentE, progress, comment, whenDone) ->
    const current = JSON.parse JSON.stringify currentE
    if current.type !== 'task'
    then 
        logPad '| You are trying to update a "' + whatIsCurrent(current) + '"', 1
        logPad '| Progress update must be created in a "task" not a "set", or a "root"', 1
        logPad '| You can use "ghoti _[somepath(task)]! [prog] [...Comments]" to update a "task"', 1
        whenDone!
        process.exit!
    else
        if parseInt(progress) === NaN
        then 
            logPad '| You can use "ghoti _[somepath(task)]! [prog] [...Comments]" to update a "task"', 1
            whenDone!
            process.exit!
        current.tea.push {
            type: 'prog'
            from: current.prog
            to: parseInt(progress)
            comment
        }
        current.prog = parseInt(progress)
    current

const calculateNewMinus = (currentE, comment, whenDone) ->
    const current = JSON.parse JSON.stringify currentE
    if current.type !== 'task'
    then 
        logPad '| You are trying to complete a "' + whatIsCurrent(current) + '"', 1
        logPad '| Task complete must be created in a "task" not a "set", or a "root"', 1
        logPad '| You can use "ghoti _[somepath(task)]- [...Comments]" to complete a "task"', 1
        whenDone!
        process.exit!
    else
        current.tea.push {
            type: 'complete'
            from: current.prog
            to: 100
            comment
        }
        current.prog = 100
    current

const calculateNewUnderlinePlus = (currentE, name, whenDone) ->
    const current = JSON.parse JSON.stringify currentE
    if current.type === 'task'
    then 
        logPad '| You are trying to create task in a "' + whatIsCurrent(current) + '"', 1
        logPad '| New task must be created in a "set" or "root" not a "task"', 1
        logPad '| You can use "ghoti _[somepath(set, root)]#" to create a "set"', 1
        whenDone!
        process.exit!
    else
        if current.child
        then current.child.push {
            name
            type: 'task'
            tea: []
            prog: 0
        }
        else if current.push
        then 
            current.push {
                name
                type: 'task'
                tea: []
                prog: 0
            }
        else
            logPad '| Unknown error', 1
            process.exit!
    current

const calculateNewUnderlineSet = (currentE, name, whenDone) ->
    const current = JSON.parse JSON.stringify currentE
    if current.type === 'task'
    then 
        logPad '| You are trying to create set in a "' + whatIsCurrent(current) + '"', 1
        logPad '| New set must be created in a "set" or "root" not a "task"', 1
        logPad '| You can use "ghoti _[somepath(set, root)]#" to create a "set"', 1
        whenDone!
        process.exit!
    else
        if current.child
        then current.child.push {
            name
            type: 'set'
            tea: []
            child: []
        }
        else if current.push
        then current.push {
            name
            type: 'set'
            tea: []
            child: []
        }
        else
            logPad '| Unknown error', 1
            process.exit!
    current

const calculateProgress = (current, whenDone, doLog? = false, logLevel? = 1) ->
    var total, amount
    total = 0
    amount = 0
    const calculateProgressRecursion = (Rcurrent, level) ->
        if !Boolean Rcurrent.type
        then
            for i in Rcurrent
                calculateProgressRecursion i, level
        else
            if Rcurrent.type === 'task'
            then 
                if doLog
                then 
                    if level <= logLevel
                    then logHalfPad '* ' + Rcurrent.name + ' > Progress: ' + Rcurrent.prog + '%', level
                amount += Rcurrent.prog
                total += 1
            else
                if doLog
                then 
                    if level <= logLevel
                    then logHalfPad '- ' + Rcurrent.name + ' > Size: ' + Rcurrent.child.length, level
                for i in Rcurrent.child
                    calculateProgressRecursion i, level + 1
        void
    calculateProgressRecursion current, 0
    {
        total
        amount
    }

export underline
export puls
export minus
export mergeGhoti
export calculateProgress
export calculateNewMinus
export calculateNewUpdate
export calculateNewUnderlineSet
export calculateNewUnderlinePlus