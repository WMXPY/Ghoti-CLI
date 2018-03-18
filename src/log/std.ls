(const log = (...text) -> 
    (console.log ...text)
    text)

(const logInline = (text) ->
    (process.stdout.write text)
    text)

(const logPad = (text, pad?) ->
    (if pad
        (for i to pad
            text = '  ' + text))
    (log text)
    text)

(const logHalfPad = (text, pad?) ->
    (if pad
        (for i to pad
            text = ' ' + text))
    (log text)
    text)

export log
export logPad
export logHalfPad
export logInline