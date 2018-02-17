require! {
    fs
    path
}

const switchRoot = (type) ->
    switch(type)
        case 'react'
            './lib/react/init'
        default
            throw new Error 'init have to use format "ghoti init react/vue/react-native/electron-react"'

const copyInitReacursion = (root, level) ->

    files = fs.readdirSync(root);

    const eachFile = (file) ->
        const pathname = root + '/' + file
        const stat = fs.lstatSync pathname


        if stat.isDirectory!
            console.log level + ' - ' + file
            copyInitReacursion root + '/' + file, level + 1
        else
            console.log level + ' * ' + file

    files.forEach eachFile
    # console.log files

const copyInit = (type) ->
    copyInitReacursion (switchRoot type), 0

copyInit 'react'