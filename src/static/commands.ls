require! {
    './commandTemplates': { list }
}

const getCommand = (name) ->
    for i in list
        for j in i.command
            if name === j
                return i
    null

const allCommands = ->
    list

const getMaxLength_List = (list) ->
    var len
    len = 0
    for i in list
        if i.command[0].length > len
        then len = i.command[0].length
    len

const getMaxLength_Entire = (command, ...rest) ->
    var len
    len = 0
    for i in rest
        if i.length > len
        then len = i.length
    for i in command.plus
        if i.length > len
        then len = i.length
    for i in command.more
        if i.length > len
        then len = i.length
    len

const getMaxLength_Plus = (command, ...rest) ->
    var len
    len = 0
    for i in rest
        if i.length > len
        then len = i.length
    for i in command.plus
        if i.length > len
        then len = i.length
    len

const padRight = (text, len) ->
    var re
    re = text
    const min = len - text.length
    for i to min
        re += ' '
    re

export getCommand
export allCommands
export padRight
export getMaxLength_List
export getMaxLength_Entire
export getMaxLength_Plus
