require! {
    '../log/std': { log, logPad, logReplace }
}

const frogGame = (ghoti, env, whenDone) ->
    log ghoti
    whenDone!

export frogGame