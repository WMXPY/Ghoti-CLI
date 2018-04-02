require! {
    fs
    path
    '../log/log': { log }
}
(const path_argv = (process.argv))
(const path_node = (path_argv.shift!))
(const path_ghoti = (path_argv.shift!))
(const mode = (path_argv.shift!))
(const path_path = (process.cwd!))
(var ghotiConfig)
(if (fs.existsSync (path.join path_path, '.ghoticonfig'))
then ghotiConfig = (JSON.parse (fs.readFileSync (path.join path_path, '.ghoticonfig')).toString!)
else ghotiConfig = {})

(const env =
    mode: mode ? 'empty'
    auto: false
    test: false
    output: false
    debug: false
    rename: false
    texture: [])

(const command = (command) ->
    (switch(command)
        case '-t'
            'test'
        case '-o'
            'output'
        case '-a'
            'auto'
        case '-r'
            'rename'
        case '-d'
            fallthrough
        default
            'debug'))

(const texture = (texture) ->
    (env.texture.push texture)
    texture)

(const argv = ->
    (path_argv.map (it) ->
        (switch(it.substring 0 1)
            case '-'
                env[command it] = true 
                (it.substring 1 it.length)
            default
                texture it))
    env)

(if (fs.existsSync (path.join path_path, '.ghoticonfig'))
then ghotiConfig = (JSON.parse (fs.readFileSync (path.join path_path, '.ghoticonfig')).toString!))

export env
export argv
export path_argv
export path_ghoti
export ghotiConfig