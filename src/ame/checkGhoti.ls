(const checkGhoti = (ghoti) ->
    (if ghoti.type
    then
        (if (ghoti.type === 'origin')
        then return true
        else if (ghoti.template)
        && (ghoti.sub)
        && (ghoti.version)
        && (ghoti.title)
        && (ghoti.config)
        && (ghoti.underline)
        && (ghoti.features)
        then return true))
    return false)

(const checkUnderline = (ghoti) ->
    (if ghoti.underline.active
    then 
        (if ghoti.underline.path
        then true))
    false)

(const checkStructure = (ghoti) ->
    (if (ghoti.components)
    && (ghoti.pages)
    && (ghoti.funcs)
    && (ghoti.lambdas)
    && (ghoti.features)
        true)
    false)

(export checkGhoti)
(export checkUnderline)
(export checkStructure)