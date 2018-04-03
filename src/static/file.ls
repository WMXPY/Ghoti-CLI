require! {
    path
    '../log/std': { log }
}

const files = [
    {
        name: [
            'nginx-conf'
            'nginx-link'
            'nginx-config'
        ]
        author: '$ghoti'
        path: 'nginx'
        file: 'nginx.d.conf.ghoti'
        whatis: [
            'nginx sub config file'
            'support a sublink'
        ]
        replaces: [
            'uniqueName'
            'port'
            'url'
        ]
    }
    {
        name: [
            'nginx'
        ]
        author: '$ghoti'
        path: 'nginx'
        file: 'nginx.conf.ghoti'
        whatis: [
            'nginx main config file'
            '.conf file'
        ]
        replaces: []
    }
    {
        name: [
            'docker-node'
        ]
        author: '$ghoti'
        path: 'docker'
        file: 'dockerfile-node.ghoti'
        whatis: [
            'dockerfile for node'
        ]
        replaces: [
            'node-version'
            'port'
            'path'
            'excuteable'
        ]
    }
]

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