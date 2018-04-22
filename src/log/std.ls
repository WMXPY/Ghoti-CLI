require! {
    readline
}

const inputStream = process.stdin
const outputStream = process.stdout

const getDisplayLength = (str) ->
    var realLength
    realLength = 0
    const len = str.length
    for i to len - 1
        var charCode
        charCode = str.charCodeAt(i);
        if charCode >= 0 && charCode <= 128 
        then realLength += 1;
        else realLength += 2;
    realLength;

const getStrOccRowColumns = (str) ->
    const consoleMaxRows = outputStream.rows
    const consoleMaxColumns = outputStream.columns
    const strDisplayLength = getDisplayLength <| str
    const rows = parseInt (strDisplayLength / consoleMaxColumns), 10
    const columns = parseInt (strDisplayLength - rows * consoleMaxColumns), 10
    {
        rows: rows,
        columns: columns
    }

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

const forceEnter = ->
    outputStream.write '\r\n'
    void

const logReplace = (content, lastContent?) ->
    var dxInfo
    if lastContent
    then dxInfo = getStrOccRowColumns <| lastContent.toString!
    else dxInfo = {
        columns: 0
        rows: 0
    }
    cursorDx = dxInfo.columns
    cursorDy = dxInfo.rows
    output = content.toString!
    readline.moveCursor outputStream, cursorDx * -1, cursorDy * -1
    readline.clearScreenDown outputStream
    outputStream.write output
    void

export log
export logPad
export logHalfPad
export logInline
export logReplace
export forceEnter