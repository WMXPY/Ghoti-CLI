
# This function should not write like this!!
# but for now, MEH
const deepClone = (thing) ->
    thing
    |> JSON.stringify
    |> JSON.parse

export deepClone