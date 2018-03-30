require! {
    path
}

const files = [
    {
        name: [
            'test'
        ]
        author: '$ghoti'
        path: 'test'
        file: 'test.q'
        whatis: [
            'test file'
        ]
        replaces: [
            'title'
            'joshua'
        ]
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