
# This function should not write like this!!
# but for now, MEH
const deepClone = (thing) ->
    thing
    |> JSON.stringify
    |> JSON.parse

const uniqueId = ->
    '_' + Math.random().toString(36).substr(2, 9);

export deepClone
export uniqueId