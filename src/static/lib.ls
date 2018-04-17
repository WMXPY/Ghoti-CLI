require! {
    path
    '../func/config': config
    '../log/std': { log }
    './libTemplates': { libs }
    './compare': { compareName }
}

const getOuter = ->
    const outer = config.readCLIConfig!
    if outer
    then if outer.external
    then if outer.external.length
    then outer
    else null

(const libList = ->
    (const re = [])
    for i in libs
        re.push {
            name: i.name[0]
            language: i.language
            framework: i.framework
            author: i.author
            location: 'built-in'
        }
    
    # downloaded template

    const outer = getOuter!
    if outer
    then
        for i in outer.external
        then
            re.push {
                name: i.name
                language: i.language
                framework: i.framework
                author: i.author
                location: 'external'
            } 
    re)

(const libPath = (folderName, ghoti_root) ->
    (path.join ghoti_root, "lib", "template", folderName))

(const commonPath = (folderName, commonName, ghoti_root) ->
    (path.join ghoti_root, "lib", "common", folderName, commonName))

const libCommons = (common, ghoti_root) ->
    const commonList = []
    for i in common
        for j in i.commons
            commonList.push commonPath(i.path, j, ghoti_root)
    commonList

(const lib = (libName, ghoti_root?) ->
    (var re, commonList)

    # build-in templates

    (for i in libs
        (for j in i.name
            (if (compareName j, libName)
                re = {...i})))
    if (Boolean re)
    then
        (if ghoti_root
        then 
            commonList = []
            re.path = (libPath re.path, ghoti_root)
            (for i in re.common
                (for j in i.commons
                    (commonList.push commonPath(i.path, j, ghoti_root))))
            re.location = 'built-in'
            (re.common = commonList))
    else

    # downloaded templates

        const outer = getOuter!
        if outer
        then
            for i in outer.external
            then
                if (compareName i.name, libName)
                then re = {...i}
            if (!(Boolean re))
            then return null
            if ghoti_root
            then
                commonList = []
                for i in re.common
                    for j in i.commons
                        commonList.push commonPath(i.path, j, ghoti_root)
                re.common = commonList
                re.location = 'external'
    (if re
    then re
    else null))

(export lib)
(export libList)
(export commonPath)
export libCommons