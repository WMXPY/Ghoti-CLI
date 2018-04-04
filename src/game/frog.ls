require! {
    '../log/std': { log, logPad, logReplace, forceEnter }
}

const prog = (current, last) ->
    const pr = (str) ->
        str + '%'
    const bar = (str, percent) ->
        var re
        re = str
        const ll = percent / 10
        re += ' |'
        for i to ll
        then re += '='
        for i to (10 - ll)
        then re += '-'
        re += '|'
        re
    const printable = bar (current |> pr), current
    logReplace printable, last
    printable

const frogGame = (ghoti, env, whenDone) ->
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