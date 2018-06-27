const ghotiConfig = {
    type: 'project'
    version: '1.0.0'
    game: false
    underline: {
        active: false
    }
    template: 'test'
    sub: 'test'
    title: 'test'
    description: 'test'
    author: 'test'
    config: {}
    components: []
    pages: []
    funcs: []
    lambdas: []
    features: []
}

const originGhotiConfig = {
    type: 'origin'
    version: '1.0.0'
    external: []
    remote: []
}

const monk_log = (fun) ->
    const logTemp = console.log
    const exitTemp = process.exit
    const logHistory = []

    console.log = (...s) !->
        const content = s.join ' '
        logHistory.push content

    process.exit = (code?) !->
        logTemp 'qq', code

    fun!

    console.log = logTemp
    process.exit = exitTemp
    return logHistory

export ghotiConfig
export originGhotiConfig
export monk_log
