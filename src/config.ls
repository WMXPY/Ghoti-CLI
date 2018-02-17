require! {
    fs
    path
}

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

export getConfig
export writeConfig