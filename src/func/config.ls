require! {
    fs
    path
    os
    '../log/log': { log }
    '../func/argv': { path_ghoti }
}

(const cliPath = ->
    (switch os.platform!
        case 'win32'
            (path.join path_ghoti, "..", "..")
        case 'darwin'
            (path.join path_ghoti, "..", "..", "lib", "node_modules", "ghoti-cli")
        default
            (path.join path_ghoti, "..", "..", "lib", "node_modules", "ghoti-cli")))

(const tempConfig = (type) ->
    var config
    (switch(type)
        case 'react'
            (config = 
                type: 'react')
        case 'vue'
            (config = 
                type: 'vue')
        case 'electron-react'
            (config = 
                type: 'electron-react')
        default
            (log 'ghoti init have to use format "ghoti init [type] [path]"')
            (log 'You can findout all type with "ghoti list"')
            (process.exit!))
    config)

(const getConfig = ->
    (var config)

    (const path_current = (process.cwd!))
    (const configExist = (fs.existsSync (path.join path_current, '.ghoticonfig')))

    (if configExist
    then config = (JSON.parse (fs.readFileSync (path.join path_current, '.ghoticonfig'), 'utf8'))
    else config = null)

    config)

(const writeConfig = (config) ->
    (const path_current = (process.cwd!))
    (const configExist = (fs.existsSync path.join path_current, '.ghoticonfig'))
    
    (if configExist
        (fs.writeFileSync (path.join path_current, '.ghoticonfig'), (JSON.stringify config) , 'utf8')
        configExist
    else 
        (fs.writeFileSync (path.join path_current, '.ghoticonfig'), (JSON.stringify config) , 'utf8')
        true))

(const writeCLIConfig = (config) ->
    (const configExist = (fs.existsSync path.join cliPath!, '.ghoticonfig'))

    (if configExist
        (fs.writeFileSync (path.join cliPath!, '.ghoticonfig'), (JSON.stringify config) , 'utf8')
        configExist
    else 
        (fs.writeFileSync (path.join cliPath!, '.ghoticonfig'), (JSON.stringify config) , 'utf8')
        true))

(const readCLIConfig = ->
    (const configExist = (fs.existsSync path.join cliPath!, '.ghoticonfig'))

    (if configExist
    then (JSON.parse (fs.readFileSync (path.join cliPath!, '.ghoticonfig'), 'utf8'))
    else false))

(const initConfig = (type) ->
    (writeConfig (tempConfig type)))

(const updateConfig = (newConfig) ->
    (writeConfig newConfig))

export getConfig
export cliPath
export writeConfig
export initConfig
export tempConfig
export updateConfig
export readCLIConfig
export writeCLIConfig