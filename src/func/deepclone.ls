
# This function should not write like this!!
# but for now, MEH
const deepClone = (thing) ->
    thing
    |> JSON.stringify
    |> JSON.parse

const uniqueIdSmall = ->
    '_' + Math.random().toString(36).substring(2, 9);

const uniqueId = (len?) ->
    if !Boolean len
    then return uniqueIdSmall!
    if len > 12 || len <= 0
    then return uniqueIdSmall!
    else 
        const re = '_' + ((Math.random!.toString 36).substring 2, (2 + len))

export deepClone
export uniqueId