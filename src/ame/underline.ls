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

const calculateProgress = (current, doLog?) ->
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
                then logHalfPad '| ' + Rcurrent.name + ' > Prograss:' + Rcurrent.prog + '%', level
                amount += Rcurrent.prog
                total += 1
            else
                if doLog
                then logHalfPad '* ' + Rcurrent.name + ' > Size:' + Rcurrent.child.length, level
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
export calculateProgress