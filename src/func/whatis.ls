require! {
    '../static/lib': { lib }
    '../static/file': { libFile }
}

(const postInstall = (type) ->
    (re = lib(type))
    (if re
    then re.postLog
    else null))

const parseKeyword = (keyword) ->
    keyword

(const whatis = (keyword) ->
    (var re)
    (re = (lib keyword))
    (if re
    then return re.whatis)

    re = libFile keyword
    if re
    then return re.whatis

    (re = {
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
    })

    (if re[keyword]
    then re[keyword]
    else null))

export whatis
export postInstall
