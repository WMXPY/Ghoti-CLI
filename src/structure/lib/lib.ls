require! {
    path
    './plib': { pageLib }
}

(const compareName = (name, name2) ->
    (const splitName = (((name.split '-').join '').toLowerCase!))
    (const splitName2 = (((name2.split '-').join '').toLowerCase!))
    splitName === splitName2)

const pathLiber = (root, name) ->
    pathBuilder root, (libPage name)

const pathBuilder = (root, libElement) ->
    if !Boolean libElement.path
    then return
    path.join root, 'lib', libElement.path, libElement.file

const libPage = (name) ->
    var re
    for i in pageLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null    

export libPage
export pathBuilder
export pathLiber