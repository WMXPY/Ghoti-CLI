require! {
    fs
    path
    './log.ls': { log }
}

const path_argv = process.argv
const path_ghoti = path_argv.shift!
const path_path = path_argv.shift!

const env =
    mode: 'init'
    test: false
    output: false
    debug: false
    commands: []

const command = (command) ->
    switch(command)
        case '-t'
            'test'
        case '-o'
            'output'
        case '-d'
            fallthrough
        default
            'debug'

const texture = (texture) ->
    env.commands.push texture
    texture

const argv = ->
    log (path.join path_path, '.ghoticonfig')
    log (fs.existsSync (path.join path_path, '.ghoticonfig'))
    # (log (fs.readFileSync (path.join path_path, '.ghoticonfig')))
    path_argv.map (it) ->
        switch(it.substring 0 1)
            case '-'
                env[command it] = true 
                it .substring 1 it.length
            default
                texture it
    env

export env
export argv
export path_argv
export path_ghoti