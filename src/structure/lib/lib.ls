require! {
    path
    './plib': { pageLib }
    './clib': { componentLib }
    './llib': { lambdaLib }
    './flib': { funcLib }
    './fflib': { featureLib }
    './tlib': { testLib }
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
    path.join root, 'lib', 'components', libElement.path, libElement.file

const libFeature = (name) ->
    var re
    for i in featureLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null

const libTest = (name) ->
    var re
    for i in testLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null

const libLambda = (name) ->
    var re
    for i in lambdaLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null

const libFunc = (name) ->
    var re
    for i in funcLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null

const libComponent = (name) ->
    var re
    for i in componentLib
    then
        if compareName name, i.name
        then re = i
    if re
    then re
    else null

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
export libComponent
export libLambda
export libFunc
export libFeature
export libTest
export pathBuilder
export pathLiber