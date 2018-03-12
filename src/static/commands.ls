const list = [
    {
        command: ['_']
        arguments: 0
        info: 'Check "ghoti underline"'
        plus: [
            {
                name: 'example'
                value: 'ghoti _'
            }
        ]
        more: [
            {
                name: 'example'
                value: 'ghoti _board'
            }
            {
                name: 'example'
                value: 'ghoti _board_inner'
            }
            {
                name: 'example'
                value: 'ghoti _board_inner?'
            }
            {
                name: 'intro'
                value: 'Introducing GHOTI UNDERLINE, check "ghoti underline"'
            }
        ]
    }
    {
        command: ['_']
        arguments: 1
        info: 'Check "ghoti underline"'
        plus: [
            {
                name: 'example'
                value: 'ghoti _+ component-devlopment'
            }
        ]
        more: [
            {
                name: 'example'
                value: 'ghoti _board- done!!!'
            }
            {
                name: 'example'
                value: 'ghoti _board! 50 half way done'
            }
            {
                name: 'example'
                value: 'ghoti _board# inner'
            }
            {
                name: 'intro'
                value: 'Introducing GHOTI UNDERLINE, check "ghoti underline"'
            }
        ]
    }
    {
        command: ['underline']
        arguments: 0
        info: 'show what is GHOTI UNDERLINE'
        plus: [
            {
                name: 'example'
                value: 'ghoti underline'
            }
        ]
        more: []
    }
    {
        command: ['about']
        arguments: 0
        info: 'show about message'
        plus: [
            {
                name: 'example'
                value: 'ghoti about'
            }
        ]
        more: []
    }
    {
        command: ['version']
        arguments: 0
        info: 'show current version'
        plus: [
            {
                name: 'example'
                value: 'ghoti version'
            }
        ]
        more: []
    }
    {
        command: [
            'status'
            'stat'
        ]
        arguments: 0
        info: 'show status of current project'
        plus: [
            {
                name: 'example'
                value: 'ghoti status'
            }
        ]
        more: []
    }
    {
        command: [
            'whatis'
            'what'
            'whatIs'
        ]
        arguments: 0
        info: 'show info of a keyword'
        plus: [
            {
                name: 'example'
                value: 'ghoti whatis react-ssr'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti whatis [keyword]'
            }
            {
                name: 'keyword'
                value: 'keyword could be any thing, you will know if it is not in the database of ghoti'
            }
        ]
    }
    {
        command: ['fix']
        arguments: 0
        info: 'try to auto fix issue'
        plus: [
            {
                name: 'example'
                value: 'ghoti fix'
            }
        ]
    }
    {
        command: ['fix']
        arguments: 1
        info: 'show error message if it is knowned'
        plus: [
            {
                name: 'example'
                value: 'ghoti fix some-issue'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti fix [name]'
            }
            {
                name: 'name'
                value: 'name could be any thing, you will know if it is not in the database of ghoti'
            }
        ]
    }
    {
        command: [
            'post'
            'hint'
        ]
        arguments: 1
        info: 'show post install information'
        plus: [
            {
                name: 'example'
                value: 'ghoti fix some-issue'
            }
            {
                name: 'info'
                value: 'normally you don\'t need to call this function'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti post [type]'
            }
            {
                name: 'type'
                value: 'type should be a init type of ghoti init'
            }
        ]
    }
    {
        command: [
            'info'
            'inf'
        ]
        arguments: 1
        info: 'show detail of a command'
        plus: [
            {
                name: 'example'
                value: 'ghoti info init'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti info [command]'
            }
            {
                name: 'command'
                value: 'command could be any command name that ghoti available'
            }
        ]
    }
    {
        command: ['list']
        arguments: 0
        info: 'show list of available init type'
        plus: [
            {
                name: 'example'
                value: 'ghoti list'
            }
        ]
        more: []
    }
    {
        command: [
            'init'
            'create'
            'template'
        ]
        arguments: 2
        info: 'init a project'
        plus: [
            {
                name: 'example'
                value: 'ghoti init react your-awesome-project'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti init [project type] [project name]'
            }
            {
                name: 'config'
                value: 'you will be ask for "title", "author", "description" later'
            }
            {
                name: 'type'
                value: 'type could be any typename in list "ghoti list"'
            }
            {
                name: 'name'
                value: 'name could be anything you want for your project'
            }
        ]
    }
    {
        command: ['example']
        arguments: 1
        info: 'create a example'
        plus: [
            {
                name: 'example'
                value: 'ghoti example [example path]'
            }
        ]
        more: [
            {
                name: 'path'
                value: 'example target path'
            }
        ]
    }
    {
        command: ['update']
        arguments: 0
        info: 'update ghoti-cli version of current project'
        plus: [
            {
                name: 'example'
                value: 'ghoti update'
            }
        ]
        more: []
    }
    {
        command: ['page']
        arguments: 1
        info: 'create a ghoti structure page'
        plus: [
            {
                name: 'example'
                value: 'ghoti page your-awesome-page'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti page [page name]'
            }
            {
                name: 'name'
                value: 'name could be any page name you want'
            }
        ]
    }
    {
        command: [
            'function'
            'func'
        ]
        arguments: 1
        info: 'create a ghoti structure function'
        plus: [
            {
                name: 'example'
                value: 'ghoti function your-awesome-function'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti function [function name]'
            }
            {
                name: 'name'
                value: 'name could be any function name you want'
            }
        ]
    }
    {
        command: ['lambda']
        arguments: 1
        info: 'create a ghoti structure lambda'
        plus: [
            {
                name: 'example'
                value: 'ghoti lambda your-awesome-lambda'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti lambda [lambda name]'
            }
            {
                name: 'name'
                value: 'name could be any lambda name you want'
            }
        ]
    }
    {
        command: ['component']
        arguments: 1
        info: 'create a ghoti structure component'
        plus: [
            {
                name: 'example'
                value: 'ghoti component your-awesome-component'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti component [component name]'
            }
            {
                name: 'name'
                value: 'name could be any component name you want'
            }
        ]
    }
    {
        command: ['feature']
        arguments: 1
        info: 'create a ghoti structure feature'
        plus: [
            {
                name: 'example'
                value: 'ghoti feature your-awesome-feature'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti feature [feature name]'
            }
            {
                name: 'name'
                value: 'name could be any feature name you want'
            }
        ]
    }
    {
        command: ['help']
        arguments: 0
        info: 'show command list'
        plus: [
            {
                name: 'example'
                value: 'ghoti help'
            }
        ]
        more: []
    }
    {
        command: ['help+']
        arguments: 0
        info: 'show command list with more example'
        plus: [
            {
                name: 'example'
                value: 'ghoti help+'
            }
        ]
        more: []
    }
]

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