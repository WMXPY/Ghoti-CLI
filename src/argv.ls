const path_argv = process.argv
const path_ghoti = path_argv.shift!

const env =
    test: false
    output: false
    debug: false

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
    texture

const argv = ->
    path_argv.map (it) ->
        switch(it.substring 0 1)
        case '-'
            env[command it] = true 
            it .substring 1 it.length
        default
            texture it

export env
export argv
export path_argv
export path_ghoti