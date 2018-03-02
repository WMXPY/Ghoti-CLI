require! {
    path
}

const defaultLogs = (part) ->
    [
        '$empty'
        'Here are some useful shortcuts for your hacking'
        'You can always enter "npm run hint" for this message again'
        '$empty'
        ...part
        '$empty'
    ]

const libs = [
    {
        name: ['react-ssr']
        path: 'react-ssr'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'use typescript'
            'test with mocha'
            'support server side render'
        ]
    }
    {
        name: ['react-parcel-ssr']
        path: 'react-parcel-ssr'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'use typescript'
            'use parcel to pack'
            'test with mocha'
            'support server side render'
        ]
    }
    {
        name: ['react-next-ssr']
        path: 'react-next-ssr'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'use typescript'
            'webpack 4'
            'test with mocha'
            'support server side render'
        ]
    }
    {
        name: ['react', 'react-normal', 'react-default']
        path: 'react-normal'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'test with mocha'
            'use typescript'
        ]
    }
    {
        name: ['react-lite', 'react-tiny']
        path: 'react-lite'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
        ])
        whatis: [
            'react single page application'
            'use typescript'
        ]
    }
    {
        name: ['react-js', 'react-js-normal']
        path: 'react-js'
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'in development'
        ]
    }
    {
        name: ['react-unstructured']
        path: 'react-unstructured'
        postLog: (defaultLogs [
            'Here are some useful shortcuts for your hacking'
            'You can always enter "npm run hint" for this message again'
            '$empty'
            'npm run feature [feature name]     > create a feature'
            '$empty'
            'npm run build                      > bundle application for production'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
        ])
        whatis: [
            'react single page application'
            'unstructured'
            'cannot use ghoti extend commands in the repo'
        ]
    }
]

const libPath = (folderName, ghoti_root) ->
    (path.join ghoti_root, "lib", folderName)

const compareName = (name, name2) ->
    const splitName = (((name.split '-').join '').toLowerCase!)
    const splitName2 = (((name2.split '-').join '').toLowerCase!)
    return splitName === splitName2

const lib = (libName, ghoti_root?) ->
    var re
    for i in libs
        for j in i.name
            if (compareName j, libName)
                re = {...i}
    if ghoti_root
    then re.path = (libPath re.path, ghoti_root)

    if re
    then re
    else null

export lib