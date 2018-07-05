require! {
    '../static/lib': { lib }
    '../static/file': { libFile }
    '../static/whatis': { libWhatis }
}

const postInstall = (type) ->
    re = lib type
    if re
    then re.postLog
    else null

const parseKeyword = (keyword) ->
    keyword

const whatis = (keyword) ->
    var re
    re = lib keyword
    if re
    then
        const result = [].concat re.whatis, ['', '-alias'], re.name 
        return result 

    re = libFile keyword
    if re
    then return re.whatis

    re = libWhatis keyword
    if re
    then return re.value

    re = {
        'git-init': [
            'git init'
            'git add .'
            'git commit -m "ghoti init"'
            'git remote add origin https://github.com/somewhere.git'
            'git push -u origin master'
        ]
        '.ghoticonfig': [
            'configeration of ghoti project'
        ]
    }

    if re[keyword]
    then re[keyword]
    else null

export whatis
export postInstall
