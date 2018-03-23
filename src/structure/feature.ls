require! {
    fs,
    path,
    '../log/log': { log, logPad }
    '../func/config': { updateConfig }
    './common': { verifyNameValiation }
}

(const ghotiTestClassName = (name) ->
    "TestGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiTestFileName = (name) ->
    name + ".test.tsx")

(const ghotiFeatureClassName = (name) ->
    "FeatureGhoti" + (name.substring 0,1).toUpperCase! + (name.substring 1, name.length))

(const ghotiFeatureFileName = (name) ->
    name + ".feature")

(const readFile = (root, name, ghoti) ->
    (var re)
    (re = ((fs.readFileSync root, 'utf8').toString!))
    (re = (re.replace /\${\|test\|}/g, (ghotiTestClassName name)))
    (re = (re.replace /\${\|feature\|}/g, (ghotiFeatureClassName name)))
    (re = (re.replace /\${\|author\|}/g, ghoti.author || "unknown"))
    re)

(const feature = (root, targetPath, name, ghoti, whenDone, env) ->
    # [2018-03-23 Update] Add verify name function 
    (verifyNameValiation name, 'feature', whenDone)
    (if (!(Boolean ghoti.features))
        (log 'ERROR, ghoti have no features configeration')
        (log 'Try to fix it: "ghoti fix"')
        (process.exit!))
    (for i in ghoti.features
        if (i === name)
            (log '| ERROR: feature "' + name + '" is already exist')
            (log '| try "ghoti status" to see features list')
            (whenDone!)
            (process.exit!))
    (const target = (path.join targetPath, "test", (ghotiTestFileName name)))
    (const featureTarget = (path.join targetPath, "feature", (ghotiFeatureFileName name)))
    (const data = (readFile (path.join root, "lib", "react", "test", "test.test.tsx.ghoti"), name, ghoti))
    (const featureData = (readFile (path.join root, "lib", "react", "feature", "feature.feature.ghoti"), name, ghoti))
    (ghoti.features.push name)
    (log '| update .ghoticonfig file')
    (updateConfig ghoti)
    (log '| initialize test script')
    (fs.writeFileSync target, data, 'utf8')
    (log '| initialize feature file')
    (fs.writeFileSync featureTarget, featureData, 'utf8'))

export feature