require! {
    os
}

const getSeprate = ->
    const platform = os.platform!

    switch platform
        case 'darwin'
            return '\n'
        case 'win32'
            fallthrough
        default
            return '\r\n'

export getSeprate