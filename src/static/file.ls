require! {
    path
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
]

(const compareName = (name, name2) ->
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

export libFile