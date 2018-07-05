require! {
    fs
}

const monk_read = (func) ->
    const fsTemp = fs.readFileSync
    const fsExistTemp = fs.existsSync
    var fileContent
    fileContent = ''

    fs.existsSync = -> true
    fs.readFileSync = (name, code) ->
        fileContent += name + ' with ' + code
        fileContent += '\r\ntest file content'
        fileContent += '\r\ntest replaceable ${|replace|}'
        fileContent += '\r\n'

    func!

    fs.readFileSync = fsTemp
    fs.existsSync = fsExistTemp
    fileContent

const monk_read_json = (func) ->
    const fsTemp = fs.readFileSync
    const fsExistTemp = fs.existsSync
    var fileContent
    fileContent = ''

    fs.existsSync = -> true
    fs.readFileSync = (name, code) ->
        fileContent += JSON.stringify {
            name: name
            code: code
            test: 'test file content'
            replace: 'test replaceable ${|replace|}'
        }

    func!

    fs.readFileSync = fsTemp
    fs.existsSync = fsExistTemp
    fileContent

const monk_read_return_json = (func) ->
    const fsTemp = fs.readFileSync
    const fsExistTemp = fs.existsSync
    var fileContent
    fileContent = ''

    fs.existsSync = -> true
    fs.readFileSync = (name, code) ->
        fileContent += JSON.stringify {
            name: name
            code: code
            test: 'test file content'
            replace: 'test replaceable ${|replace|}'
        }

    const re = func!

    fs.readFileSync = fsTemp
    fs.existsSync = fsExistTemp
    re

export monk_read
export monk_read_json
export monk_read_return_json