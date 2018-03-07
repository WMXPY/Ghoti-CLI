require! {
    './std': { log }
}

(const logSeprate = (length) ->
    (var re)
    (re = '')
    (for i to length
        re += '-')
    (log re)
    re)

const logTable = (table, ...title) ->
    title = title.map (it) ->
        {
            text: it
            length: it.length
        }
    for i in table
        for j to i.length - 1
            if i[j].length > title[j].length
            then title[j].length = i[j].length
    var titleDisplay
    titleDisplay = ''
    for i in title
        const minus = i.length - i.text.length
        i.text = ' ' + i.text + ' '
        for space to minus / 2
            i.text = ' ' + i.text + ' '
        titleDisplay += '|' + i.text
    titleDisplay += '|'
    logSeprate titleDisplay.length - 1
    log titleDisplay
    logSeprate titleDisplay.length - 1
    for i in table
        var lane
        lane = ''
        for j to i.length - 1
            lane += '| ' + i[j]
            const cat = title[j].length - i[j].length
            for _ to cat + 2
                lane += ' '
        log lane + '|'
    logSeprate titleDisplay.length - 1

export logTable