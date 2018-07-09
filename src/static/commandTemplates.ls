const list = [
    {
        command: [
            'tilde'
            '~'
        ]
        arguments: 0
        info: 'Start tilde command configuration setup'
        plus: [
            {
                name: 'example'
                value: 'ghoti ~'
            }
        ]
        more: []
    }
    {
        command: [
            'bk'
            'b'
            'bark'
        ]
        arguments: 1
        info: 'Excute bark lang'
        plus: [
            {
                name: 'example'
                value: 'ghoti b "return 1"'
            }
        ]
        more: []
    }
    {
        command: ['~[#?]']
        arguments: 0
        info: 'Excute tilde command'
        plus: [
            {
                name: 'example'
                value: 'ghoti ~[command name]'
            }
        ]
        more: [
            {
                name: 'example'
                value: 'ghoti ~ghoti'
            }
        ]
    }
    {
        command: ['_[#?]']
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
        command: ['_[#]']
        arguments: 1
        info: 'Check "ghoti underline"'
        plus: [
            {
                name: 'example'
                value: 'ghoti _+ component-devlopment'
            }
            {
                name: 'example'
                value: 'ghoti _[path] component-devlopment'
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
        command: [
            'underline'
        ]
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
        command: [
            '!'
        ]
        arguments: 0
        info: 'enter ghoti game interface'
        plus: [
            {
                name: 'example'
                value: 'ghoti !'
            }
        ]
        more: []
    }
    {
        command: [
            '!'
        ]
        arguments: 1
        info: 'command ghoti game'
        plus: [
            {
                name: 'example'
                value: 'ghoti ! ?'
            }
            {
                name: 'example'
                value: 'ghoti ! [commands]'
            }
        ]
        more: [
            {
                name: 'more'
                value: 'to get all ghoti ! commands, try ghoti ! ?'
            }
        ]
    }
    {
        command: [
            'game'
            'minigame'
            'g'
        ]
        arguments: 0
        info: 'show what is GHOTI GAME'
        plus: [
            {
                name: 'example'
                value: 'ghoti game'
            }
        ]
        more: []
    }
    {
        command: [
            'about'
            'a'
        ]
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
        command: [
            'version'
            'v'
        ]
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
            'w'
        ]
        arguments: 1
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
        command: [
            '='
        ]
        arguments: 1
        info: 'show info of a keyword (also "whatis")'
        plus: [
            {
                name: 'example'
                value: 'ghoti = react-ssr'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti = [keyword]'
            }
            {
                name: 'keyword'
                value: 'keyword could be any thing, you will know if it is not in the database of ghoti'
            }
        ]
    }
    {
        command: [
            '=[#]'
        ]
        arguments: 0
        info: 'short version of show info of a keyword (also "whatis")'
        plus: [
            {
                name: 'example'
                value: 'ghoti =react-ssr'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti =[keyword]'
            }
            {
                name: 'keyword'
                value: 'keyword could be any thing, you will know if it is not in the database of ghoti'
            }
        ]
    }
    {
        command: [
            'fix'
            'issue'
        ]
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
        command: [
            'fix'
            'issue'
        ]
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
            'h'
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
        command: [
            'list'
            'types'
            'lt'
        ]
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
            'list+'
            'types+'
            'listPlus'
            'lt+'
        ]
        arguments: 0
        info: 'show list of available init type, with more detail'
        plus: [
            {
                name: 'example'
                value: 'ghoti list+'
            }
        ]
        more: []
    }
    {
        command: [
            'listFile'
            'files'
            'lf'
        ]
        arguments: 0
        info: 'show list of available file type'
        plus: [
            {
                name: 'example'
                value: 'ghoti files'
            }
        ]
        more: []
    }
    {
        command: [
            'install'
            'download'
            'd'
        ]
        arguments: 1
        info: 'download achive from external source'
        plus: [
            {
                name: 'example'
                value: 'ghoti install github://xxx/xxx/a.zip'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti init [source]'
            }
            {
                name: 'source'
                value: 'could be "http", "https", "file", "github"'
            }
        ]
    }
    {
        command: [
            'init'
            'create'
            'template'
            'new'
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
        command: [
            'merge'
            'mer'
            'm'
        ]
        arguments: 1
        info: 'merge a project template to current folder'
        plus: [
            {
                name: 'example'
                value: 'ghoti merge react'
            }
        ]
        more: [
            {
                name: 'arguments'
                value: 'ghoti merge [project type]'
            }
            {
                name: 'type'
                value: 'type could be any typename in list "ghoti list"'
            }
        ]
    }
    {
        command: [
            'example'
        ]
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
        command: [
            'update'
        ]
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
        command: [
            'page'
            '+p'
        ]
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
            '+f'
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
        command: [
            'lambda'
            '+l'
        ]
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
        command: [
            'component'
            '+c'
        ]
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
        command: [
            'feature'
            '+t'
        ]
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
        command: [
            'help'
            '?'
        ]
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
        command: [
            'help+'
            '?+'
        ]
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
    {
        command: [
            'file'
            'files'
            'f'
        ]
        arguments: 1
        info: 'copy target file to current path'
        plus: [
            {
                name: 'example'
                value: 'ghoti file [some file]'
            }
        ]
        more: [
            {
                name: 'some file'
                value: 'file\'s nick name, see ghoti flist'
            }
        ]
    }
    {
        command: [
            'file'
            'files'
            'f'
        ]
        arguments: 2
        info: 'copy target file to target path'
        plus: [
            {
                name: 'example'
                value: 'ghoti file [some file] [some path]'
            }
        ]
        more: [
            {
                name: 'some file'
                value: 'file\'s nick name, see ghoti files'
            }
            {
                name: 'some path'
                value: 'the target path you want the file in'
            }
        ]
    }
    {
        command: [
            'suffix'
            'suff'
            'suf'
            's'
        ]
        arguments: 2
        info: 'suffix all file in target path to make it installable'
        plus: [
            {
                name: 'example'
                value: 'ghoti suffix [some path] [dist path]'
            }
        ]
        more: [
            {
                name: 'some path'
                value: 'the path you want to suffix'
            }
            {
                name: 'dist path'
                value: 'path to output files in'
            }
        ]
    }
    {
        command: [
            'pack'
            'p'
        ]
        arguments: 2
        info: 'make all files in target path in to a installble package'
        plus: [
            {
                name: 'example'
                value: 'ghoti pack [some path] [package name]'
            }
        ]
        more: [
            {
                name: 'some path'
                value: 'the path you want to pack up'
            }
            {
                name: 'package name'
                value: 'name of builded .zip file'
            }
        ]
    }
]

export list