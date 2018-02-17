require! {
    fs
    path
    './config.ls': config
}

const argv = process.argv
const path_ghoti = argv.shift!

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

const log = (text) -> 
    console.log text

# log argv.map (it) ->
#     switch(it.substring 0 1)
#         case '-'
#             env[command it] = true 
#             it .substring 1 it.length
#         default
#             texture it
# log env