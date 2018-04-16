require! {
    fs
    path
    '../../log/std': { log }
    '../deepclone': { deepClone }
    './commentsTemplates': { comments }
    './languageTemplates': { languages }
}

const libComments = (type, vars?) ->
    if !Boolean vars
    then vars = []
    var re
    for i in comments
    then
        if i.name === type
        then re = deepClone i.content
    if re
    then re.join '\n'
    else null

const libLanguages = (language) ->
    for i in languages
    then
        if i.ext === language
        || ('.' + i.ext) === language
        then return i
    null

const determinLanguage = (filename) ->
    const ext = path.extname filename
    const lan = libLanguages ext
    if lan
    then lan.name
    else null

const addComments = (filename, context) ->
    const lang = determinLanguage filename
    const vars = 
        overview: 'over'
    var adding
    switch lang
        case 'javascript'
            fallthrough
        case 'typescript'
            fallthrough
        case 'golang'
            adding = libComments 'normal', vars
        case 'livescript'
            fallthrough
        case 'python'
            adding = libComments 'sharp', vars
    if adding
    then adding + '\n\n' + context
    else context

export determinLanguage
export addComments