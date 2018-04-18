(const compareName = (name, name2) ->
    if (!Boolean name) || (!Boolean name2)
    then return false
    (const splitName = (((name.split '-').join '').toLowerCase!))
    (const splitName2 = (((name2.split '-').join '').toLowerCase!))
    splitName === splitName2)

export compareName