require! {
    fs,
    path,
    './common': { comments, verifyNameValiation }
    './lib/lib': { libPage, pathBuilder }
    '../log/log': { log, logPad }
    '../func/config': { updateConfig }
    '../func/fs/fileController': { readFileC }
}

(const ghotiPageClassName = (name) ->
    "PageGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiPageFileName = (name, vue?) ->
    if vue
    then name + '.page.vue'
    else name + '.page' )

(const ghotiPageExport = (name) ->
    "    " + (ghotiPageClassName name) + " as " + name)

(const readFile = (root, name, ghoti) ->
    (var re)
    (re = ((readFileC root, 'utf8').toString!))
    (re = (re.replace /\${\|page\|}/g, (ghotiPageClassName name)))
    (re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown"))
    re)

(const comImport = (ghoti) ->
    (if (!(Boolean ghoti.pages))
        (log 'ERROR, ghoti have no pages configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (var re)
    re = comments 'page'
    (re += (ghoti.pages.map ((it) ->
        "import " + (ghotiPageClassName it) + " from './" + (ghotiPageFileName it) + "';")).join("\r\r\n"))
    (re += "\r\r\n")
    (re += "export {\r\r\n" + (ghoti.pages.map ((it) ->
        (ghotiPageExport it) + ",")).join("\r\r\n") + "\r\r\n};\r\r\n")
    re)

(const comImportVue = (ghoti) ->
    (if (!(Boolean ghoti.pages))
        (log 'ERROR, ghoti have no pages configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (var re)
    re = comments 'pages'
    (re += (ghoti.pages.map ((it) ->
        "import " + (ghotiPageClassName it) + " from './" + (ghotiPageFileName it, true) + "';")).join("\r\r\n"))
    (re += "\r\r\n")
    (re += "export {\r\r\n" + (ghoti.pages.map ((it) ->
        (ghotiPageExport it) + ",")).join("\r\r\n") + "\r\r\n};\r\r\n")
    re)

(const page = (root, targetPath, name, ghoti, whenDone, env) ->
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValiation name, 'page', whenDone)
    (if (!(Boolean ghoti.pages))
        (log 'ERROR, ghoti have no pages configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (for i in ghoti.pages
        (if(i === name)
            (log '| ERROR: page "' + name + '" is already exist')
            (log '| try "ghoti status" to see page list')
            (whenDone!)
            (process.exit!)))
    (var data, target, importTarget)
    (switch ghoti.template
        case 'react'

            # Update, libPage and path builder
            data = (readFile (pathBuilder root, (libPage 'react-tsx')), name, ghoti)
            target = (path.join targetPath, "src", "page", name + ".page.tsx" )
            importTarget = (path.join targetPath, "src", "page", "import.ts" )
        case 'react-js'
            data = (readFile (pathBuilder root, (libPage 'react-jsx')), name, ghoti)
            target = (path.join targetPath, "src", "page", name + ".page.jsx" )
            importTarget = (path.join targetPath, "src", "page", "import.js" )
        case 'vue'
            data = (readFile (pathBuilder root, (libPage 'vue')), name, ghoti)
            target = (path.join targetPath, "src", "page", name + ".page.vue" )
            importTarget = (path.join targetPath, "src", "page", "import.ts" )
        default
            (log '| ERROR: type "' + ghoti.template + '" is not supported')
            (log '| Try "ghoti status" to see current type issue')
            (log '| Try "ghoti whatis ' + ghoti.template + '" is there any known issue')
            (whenDone!)
            (process.exit!))
    (ghoti.pages.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    switch ghoti.template
        case 'vue'
            (log '| update addon setting')
            (fs.writeFileSync importTarget, (comImportVue ghoti), 'utf8')
        default
            (log '| update import setting')
            (fs.writeFileSync importTarget, (comImport ghoti), 'utf8')
    (log '| initialize paging script')
    (fs.writeFileSync target, data, 'utf8')
    void)

export page