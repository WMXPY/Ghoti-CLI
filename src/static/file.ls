require! {
    path
    '../func/config': config
    './fileTemplates': { files }
    './compare': { compareName }
    '../log/std': { log }
}

const getOuter = ->
    const outer = config.readCLIConfig!
    if outer
    then if outer.remote
    then if outer.remote.length
    then outer
    else null

const libFile = (fileName, ghoti_root) ->
    var re

    # build-in files

    for i in files
        for j in i.name
            if compareName j, fileName
                re = {...i}
                re.location = 'built-in'
    if re
    then return re
    else 

    # downloaded files

        const outer = getOuter!
        if outer
        then 
            for i in outer.remote
            then
                if compareName i.name, fileName
                then 
                    re = {...i}
                    re.path = path.join i.path, i.main
                    re.file = i.main
                    re.location = 'external'
                    log re
            if !Boolean re
            then return null
            else return re

const libFileList = ->
    (const re = [])
    (for i in files
        const ea = 
            name: i.name[0]
            author: i.author
            location: 'built-in'
        (re.push ea))

    const outer = getOuter!
    if outer
    then 
        for i in outer.remote
        then
            re.push {
                name: i.name
                author: i.author
                location: 'external'
            }
    re

export libFile
export libFileList