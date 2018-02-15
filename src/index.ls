require! {
    fs
    path
}

const argv = process.argv
const path_ghoti = argv.shift!

const command = (command) ->
    command

const texture = (texture) ->
    texture

const log = (text) -> 
    console.log text

log argv.map (it) ->
    switch(it.substring 0 1)
        case '-'
            command it
        default
            texture it

log argv