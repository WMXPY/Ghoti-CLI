require! {
    fs
    path
    '../../log/std': { log }
    '../deepclone': { deepClone }
    './commentsTemplates': { comments }
    './languageTemplates': { languages }
    '../../ame/osDiff': { getSeparate }
}

const mapVars = (vars) ->
    const re = []
    for i of vars
    then re.push {
        name: i,
        value: vars[i]
    }
    re

const replaceVar = (text, vars) ->
    var re
    re = text
    for i in vars
    then 
        re = text.replace (new RegExp '\\${\\|' + i.name + '\\|}', 'g'), i.value
    re

const replaceVars = (contentE, vars) ->
    const content = deepClone contentE
    for i to content.length - 1
    then content[i] = replaceVar content[i], vars
    content

const libComments = (type, vars?) ->
    if !Boolean vars
    then vars = []
    var re
    for i in comments
    then
        if i.name === type
        then re = deepClone i.content
    if re
    then (replaceVars re, vars).join getSeparate!
    else null

const libLanguages = (language) ->
    for i in languages
    then
        if i.ext === language
        || ('.' + i.ext) === language
        then return i
    null

const determineLanguage = (filename) ->
    var ext
    ext = path.extname filename
    if ext === '.ghoti'
    then ext = path.extname (filename.substring 0, filename.length - 6)
    const lan = libLanguages ext
    if lan
    then lan.name
    else null

const getComments = (filename, vars) ->
    const lang = determineLanguage filename
    var adding
    switch lang
        case 'javascript'
            fallthrough
        case 'typescript'
            fallthrough
        case 'sass'
            fallthrough
        case 'golang'
            adding = libComments 'normal', vars
        case 'livescript'
            fallthrough
        case 'python'
            adding = libComments 'sharp', vars
    return adding

const addComments = (filename, context, vars) ->
    const adding = getComments filename, vars
    if adding
    then adding + getSeparate! + getSeparate! + context
    else context

const parseComments = (filename, content, vars) ->
    if !Boolean content.split
    then return content
    if vars && (!Boolean vars.length) && (!Boolean vars.push)
    then vars = mapVars vars
    const splited = content.split(getSeparate!)
    if (splited[0].substring 0, 5) === '// G!'
    then
        const overview = splited[0].substring 5, splited[0].length
        vars.push {
            name: 'overview'
            value: overview
        }
        splited[0] = (getComments filename, vars) + getSeparate!
    splited.join getSeparate!

export determineLanguage
export addComments
export parseComments