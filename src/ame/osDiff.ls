require! {
    os
}

const getSeprate = ->
    switch os.platform!
        case 'win32'
            return '\r\n'
        case 'darwin'
            return '\n'
        default
            return '\n'

export getSeprate