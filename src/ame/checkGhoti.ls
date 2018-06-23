(const checkGhoti = (ghoti) ->
    (if ghoti.type
    then
        (if (ghoti.type === 'origin')
        then return true
        else if ((Boolean ghoti.template)
        && (Boolean ghoti.sub)
        && (Boolean ghoti.version)
        && (Boolean ghoti.title)
        && (Boolean ghoti.config)
        && (Boolean ghoti.underline)
        && (Boolean ghoti.features))
        then return true))
    return false)

(const checkUnderline = (ghoti) ->
    (if ghoti.underline.active
    then 
        (if ghoti.underline.path
        then true))
    false)

(const checkStructure = (ghoti) ->
    (if ((Boolean ghoti.components)
    && (Boolean ghoti.pages)
    && (Boolean ghoti.funcs)
    && (Boolean ghoti.lambdas)
    && (Boolean ghoti.features))
    then return true)
    false)

(export checkGhoti)
(export checkUnderline)
(export checkStructure)