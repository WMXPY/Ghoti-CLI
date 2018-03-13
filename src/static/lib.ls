require! {
    path
}

(const defaultLogs = (part) ->
    [
        '$empty'
        'Here are some useful shortcuts for your hacking'
        'You can always enter "npm run hint" for this message again'
        '$empty'
        ...part
        '$empty'
    ])

const libs = [
    {
        name: [
            'react-ssr'
            'react-server'
            'react-server-side-render'
            'react-server-side-rending'
        ]
        author: '$ghoti'
        path: 'react-ssr'
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
            'middle-ssr'
        ]
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
            'suggested'
        ]
    }
    {
        name: [
            'react-thin-ssr'
            'react-ssr-thin'
            'react-server-thin'
            'react-thin-server'
            'react-thin-server-side-render'
            'react-thin-server-side-rending'
        ]
        author: '$ghoti'
        path: 'react-thin-ssr'
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
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
            'use sample middleware'
            'not suggested'
        ]
    }
    {
        name: [
            'react-parcel-ssr'
            'react-parcel-server'
            'react-ssr-parcel'
            'react-server-parcel'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
            'middle-ssr'
        ]
        author: '$ghoti'
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
        name: [
            'react-next-ssr'
            'react-next-server'
            'react-ssr-next'
            'react-server-next'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
        author: '$ghoti'
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
        name: [
            'react'
            'react-typescript'
            'react-ts'
            'react-normal'
            'react-normal-ts'
            'react-ts-normal'
            'react-typescript-normal'
            'react-default'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
        author: '$ghoti'
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
        name: [
            'react-chrome-extension'
            'react-chrome'
            'react-ts-chrome-extension'
            'react-ts-chrome'
            'react-chrome-ts'
            'react-extension-chrome'
        ]
        common: [
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
        author: '$ghoti'
        path: 'react-chrome-extension'
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
            'react chrome extension'
            'test with mocha'
            'use typescript'
        ]
    }
    {
        name: [
            'react-lite'
            'react-tiny'
        ]
        common: [
            'ghoti'
            'typescript'
            'public'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
        author: '$ghoti'
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
        name: [
            'react-js'
            'react-javascript'
            'react-js-normal'
            'react-normal-js'
            'react-js-default'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'ghoti'
            'sass-style'
        ]
        author: '$ghoti'
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
        name: [
            'react-unstructured'
            'react-none'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'sass-style'
        ]
        author: '$ghoti'
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
    {
        name: [
            'react-ghoti-training'
            'react-training-ghoti'
            'training-ghoti'
            'ghoti-training'
            'example-ghoti'
            'ghoti-example'
        ]
        common: [
            'ghoti'
            'public'
            'eslint'
            'tslint'
            'typescript'
            'typescript-config'
            'typescript-feature'
            'typescript-structure'
            'sass-style'
        ]
        author: '$ghoti-example'
        path: 'react-ghoti-train'
        postLog: [
            '$empty'
            'HELLO WORLD!'
            'This example will help you start use ghoti in your project'
            '$empty'
            'TO START'
            'RUN "npm start" in your terminal'
            '$empty'
        ]
        whatis: [
            'help you know what ghoti do'
            'react single page application'
            'unstructured'
            'cannot use ghoti extend commands in the repo'
        ]
    }
]

(const libList = ->
    (const re = [])
    (for i in libs
        (const ea = 
            name: i.name[0]
            author: i.author)
        (re.push ea))
    re)

(const libPath = (folderName, ghoti_root) ->
    (path.join ghoti_root, "lib", folderName))

(const commonPath = (folderName, ghoti_root) ->
    (path.join ghoti_root, "lib", "common", folderName))

(const compareName = (name, name2) ->
    (const splitName = (((name.split '-').join '').toLowerCase!))
    (const splitName2 = (((name2.split '-').join '').toLowerCase!))
    splitName === splitName2)

(const lib = (libName, ghoti_root?) ->
    (var re)
    (for i in libs
        (for j in i.name
            (if (compareName j, libName)
                re = {...i})))
    (if (!(Boolean re))
    then return null)
    (if ghoti_root
    then 
        re.path = (libPath re.path, ghoti_root)
        (for i to re.common.length - 1
            re.common[i] = commonPath(re.common[i], ghoti_root)))

    (if re
    then re
    else null))

(export lib)
(export libList)
(export commonPath)