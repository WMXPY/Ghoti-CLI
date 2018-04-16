require! {
    './fixTemplates': { errorList }
}

const findError = (errorNameListE) ->
    const errorNameList = errorNameListE.map (it) ->
        it.toLowerCase!
    var count
    for i in errorList
        count = 0
        for j in i.name
            if (errorNameList.indexOf (j.toLowerCase!)) !== -1
            then count++
        if count === i.name.length
        then return i
    null

const findSim = (errorNameListE) ->
    const errorNameList = errorNameListE.map (it) ->
        it.toLowerCase!
    const sameList = []
    var count
    for i in errorList
        count = 0
        for j in i.name
            if (errorNameList.indexOf (j.toLowerCase!)) !== -1
            then count++
        if count >= (parseInt i.name.length / 2)
        then (sameList.push i)
    sameList

export findError
export findSim
