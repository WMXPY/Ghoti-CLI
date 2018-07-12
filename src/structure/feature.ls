require! {
    fs,
    path,
    '../log/log': { log, logPad }
    './lib/lib': { libFeature, libTest, pathBuilder }
    '../func/config': { updateConfig }
    './common': { verifyNameValidation }
    '../func/fs/fileController': { readFileC }
}

(const ghotiTestClassName = (name) ->
    "TestGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiTestFileName = (name) ->
    name + ".test.tsx")

(const ghotiTestVueFileName = (name) ->
    name + ".vue.ts")

(const ghotiTestNormalFileName = (name) ->
    name + ".test.ts")

(const ghotiFeatureClassName = (name) ->
    "FeatureGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiFeatureFileName = (name) ->
    name + ".feature")

(const readFile = (root, name, ghoti) ->
    (var re)
    (re = ((readFileC root, 'utf8').toString!))
    (re = (re.replace /\${\|test\|}/g, (ghotiTestClassName name)))
    (re = (re.replace /\${\|feature\|}/g, (ghotiFeatureClassName name)))
    (re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown"))
    re)

(const feature = (root, targetPath, name, ghoti, whenDone, env) ->
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValidation name, 'feature', whenDone)
    (if (!(Boolean ghoti.features))
        (log 'ERROR, ghoti have no features configuration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (for i in ghoti.features
        if (i === name)
            (log '| ERROR: feature "' + name + '" is already exist')
            (log '| try "ghoti status" to see features list')
            (whenDone!)
            (process.exit!))
    (const featureTarget = (path.join targetPath, "feature", (ghotiFeatureFileName name)))
    (switch ghoti.template
        case 'react'
            data = (readFile (pathBuilder root, (libTest 'react')), name, ghoti)
            target = (path.join targetPath, "test", (ghotiTestFileName name))
        case 'react-js'
            data = (readFile (pathBuilder root, (libTest 'react-js')), name, ghoti)
            target = (path.join targetPath, "test", (ghotiTestFileName name))
        case 'vue'
            data = (readFile (pathBuilder root, (libTest 'vue')), name, ghoti)
            target = (path.join targetPath, "test", (ghotiTestVueFileName name))
        case 'node'
            data = (readFile (pathBuilder root, (libTest 'node')), name, ghoti)
            target = (path.join targetPath, "test", (ghotiTestNormalFileName name))
        default
            (log '| ERROR: type "' + ghoti.template + '" is not supported')
            (log '| Try "ghoti status" to see current type issue')
            (log '| Try "ghoti whatis ' + ghoti.template + '" is there any known issue')
            (whenDone!)
            (process.exit!))
    (const featureData = (readFile (pathBuilder root, (libFeature 'default')), name, ghoti))
    (ghoti.features.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| initialize test script')
    (fs.writeFileSync target, data, 'utf8')
    (log '| initialize feature file')
    (fs.writeFileSync featureTarget, featureData, 'utf8'))

export feature