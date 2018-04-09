require! {
    path
    './fileTemplates': { files }
    '../log/std': { log }
}

(const compareName = (name, name2) ->
    if (!Boolean name) || (!Boolean name2)
    then 
        log '| Name is not issued'
        log '| Try "ghoti flist" for file list'
        process.exit!
    (const splitName = (((name.split '-').join '').toLowerCase!))
    (const splitName2 = (((name2.split '-').join '').toLowerCase!))
    splitName === splitName2)

const libFile = (fileName, ghoti_root) ->
    var re
    for i in files
        for j in i.name
            if compareName j, fileName
                re = {...i}
    if !Boolean re
    then return null
    else return re

(const libFileList = ->
    (const re = [])
    (for i in files
        (const ea = 
            name: i.name[0]
            author: i.author)
        (re.push ea))
    re)

export libFile
export libFileList