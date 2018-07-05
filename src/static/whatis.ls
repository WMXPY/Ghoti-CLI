require! {
    './whatisTemplates': { whatiss }
    './compare': { compareName }
}

const libWhatis = (name) ->
    for i in whatiss
    then
        if compareName name, i.name
        then 
            return i
    void

export libWhatis