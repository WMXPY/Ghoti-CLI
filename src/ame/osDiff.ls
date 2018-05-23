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
            return '\r\n'

export getSeprate