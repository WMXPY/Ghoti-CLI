require! {
    '../log/std': { log, logPad, logReplace, forceEnter }
    '../eng/eng': { controller }
    './game': gameImport
}

const game = gameImport.default

const prog = (current, last) ->
    const pr = (str) ->
        str = str.toString!
        if str.length === 1
        then str = '00' + str
        if str.length === 2
        then str = '0' + str
        str + '%'
    const bar = (str, percent) ->
        var re
        re = str
        const ll = Math.floor (percent / 4)
        re += ' |'
        for i to (ll - 1)
        then re += '#'
        for i to ((25 - ll) - 1)
        then re += '='
        re += '|'
        re
    const printable = bar (current |> pr), current
    logReplace printable, last
    printable
        
const frogGame = (ghoti, env, whenDone) ->
    game!
    if !Boolean ghoti.game
    then
        log '| Ghoti Game is not activated, try "Ghoti game"'
        whenDone!
        process.exit!
    const rec = (count, last) ->
        setTimeout (->
            if count > 100
            then
                forceEnter!
                whenDone!
            else
                const lla = prog count, last
                rec count + 1, lla
            void
        ), 100
    rec 0, 0
    void

export frogGame