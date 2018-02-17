require! {
    fs
    path
}

const tempConfig = (type) ->
    var config

    switch(type)
        case 'react'
            config = 
                type: 'react'
        case 'vue'
            config = 
                type: 'vue'
        case 'electron-react'
            config = 
                type: 'electron-react'
        case 'react-native'
            config = 
                type: 'react-native'
        default
            throw new Error 'init have to use format "ghoti init react/vue/react-native/electron-react"'
    
    config

    # const config = 
    #     a: 1
    #     b: 2

const getConfig = ->
    var config

    const path_current = process.cwd!
    const configExist = fs.existsSync path.join path_current, '.ghoticonfig'

    if configExist
    then config = JSON.parse fs.readFileSync (path.join path_current, '.ghoticonfig'), 'utf8'
    else config = null

    config

const writeConfig = (config) ->
    const path_current = process.cwd!
    const configExist = fs.existsSync path.join path_current, '.ghoticonfig'
    
    if configExist
        fs.writeFileSync (path.join path_current, '.ghoticonfig'), (JSON.stringify config) , 'utf8'
        configExist
    else 
        fs.writeFileSync (path.join path_current, '.ghoticonfig'), (JSON.stringify config) , 'utf8'
        true


const initConfig = (type) ->
    writeConfig tempConfig type

export getConfig
export writeConfig
export initConfig
export tempConfig