const checkGhoti = (ghoti) ->
    if ghoti.type
    && ghoti.template
    && ghoti.sub
    && ghoti.version
    && ghoti.title
    && ghoti.description
    && ghoti.author
    && ghoti.config
    && ghoti.underline
    && ghoti.features
        true
    false

const checkUnderline = (ghoti) ->
    if ghoti.underline.active
    then 
        if ghoti.underline.path
            true
    false

const checkStructure = (ghoti) ->
    if ghoti.components
    && ghoti.pages
    && ghoti.funcs
    && ghoti.lambdas
    && ghoti.features
        true
    false

export checkGhoti
export checkUnderline
export checkStructure