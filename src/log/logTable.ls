require! {
    './std': { log }
}

const logSeprate = (length) ->
    var re
    re = ''
    for i to length
    then re += '-'
    log re
    re

const logTable = (table, ...title) ->
    title = title.map (it) ->
        {
            text: it
            length: it.length
        }

    # Update 2018-04-19
    # Add number element support
    table = table.map (it) ->
        if it.map
        then it.map (itit) ->
            itit.toString!
        else it.toString!

    for i in table
    then for j to i.length - 1
        then if i[j].length > title[j].length
            then title[j].length = i[j].length
    var titleDisplay
    titleDisplay = ''
    for i in title
        const minus = i.length - i.text.length
        i.text = ' ' + i.text + ' '
        for space to minus / 2
        then i.text = ' ' + i.text + ' '
        if minus % 2 !== 0
        then i.text += ' '
        titleDisplay += '|' + i.text
    titleDisplay += '|'
    logSeprate titleDisplay.length - 1
    log titleDisplay
    logSeprate titleDisplay.length - 1
    for i in table
        var lane
        lane = ''
        for j to i.length - 1
        then
            lane += '| ' + i[j]
            const cat = title[j].length - i[j].length
            for _ to cat + 2
            then lane += ' '
        (log lane + '|')
    logSeprate titleDisplay.length - 1
    void

export logTable