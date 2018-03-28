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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                    'middle-ssr'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
            'use typescript'
            'test with mocha'
            'support server side render'
            'suggested'
        ]
    }
    {
        name: [
            'react-pure-static-express'
            'react-express-static-pure'
            'react-pure'
            'react-pure-express'
            'pure-react'
            'express-pure-react'
            'reacr-pure-static'
        ]
        author: '$ghoti'
        path: 'react-pure-static-express'
        common: [
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public-lite'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config-server'
                ]
            }
        ]
        postLog: (defaultLogs [
            'npm run feature [feature name]     > create a feature'
            'npm run lambda [function name]     > create a lambda function set'
            'npm run component [function name]  > create a component'
            'npm run page [page name]           > create a page'
            'npm run func [function name]       > create a function set'
            '$empty'
            'npm start                          > start development with localhost server'
            'npm test                           > test features by mocha'
            'npm run build                      > bundle application and get server ready'
            'npm run server                     > start muti thread server'
        ])
        whatis: [
            'react pure static application'
            'build with webpack 3'
            'use typescript'
            'test with mocha'
            'server use express'
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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
            'use typescript'
            'test with mocha'
            'support server side render'
            'use sample middleware'
            'not suggested'
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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'public-lite'
                    'public-template-lite'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
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
            {
                path: 'react'
                commons: [
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                ]
            }
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
            'build with webpack 3'
            'in development'
        ]
    }
    {
        name: [
            'react-unstructured'
            'react-none'
        ]
        common: [
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
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
            'build with webpack 3'
            'unstructured'
            'cannot use ghoti extend commands in the repo'
        ]
    }
    {
        name: [
            'vue'
            'vue-normal'
        ]
        common: [
            {
                path: 'vue'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'public-template-vue'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
        ]
        author: '$ghoti'
        path: 'vue-normal'
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
            'vue.js single page application'
            'build with webpack 3'
            'ghoti cli structure'
        ]
    }
    {
        name: [
            'node'
            'node-normal'
            'nodee'
        ]
        common: [
            {
                path: 'node'
                commons: [
                    'structure-readme'
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
        ]
        author: '$ghoti'
        path: 'node-normal'
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
            'nodeJS application'
            'use typescript'
            'ghoti cli structure'
        ]
    }
    {
        name: [
            'node-discord'
            'discord-node'
            'discord'
        ]
        common: [
            {
                path: 'node'
                commons: [
                    'structure-readme'
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
        ]
        author: '$ghoti'
        path: 'node-discord'
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
            'discord application devlopment'
            'nodeJS application'
            'use typescript'
            'ghoti cli structure'
        ]
    }
    {
        name: [
            'node-server'
            'server-node'
            'node-express'
            'express'
        ]
        common: [
            {
                path: 'node'
                commons: [
                    'structure-readme'
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'eslint'
                    'tslint'
                    'typescript-config-server'
                ]
            }
        ]
        author: '$ghoti'
        path: 'node-server'
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
            'express http server application'
            'nodeJS application'
            'use typescript'
            'ghoti cli structure'
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
            {
                path: 'react'
                commons: [
                    'typescript'
                    'typescript-feature'
                    'typescript-structure'
                    'sass-style'
                ]
            }
            {
                path: 'common'
                commons: [
                    'ghoti'
                    'public'
                    'public-template'
                    'eslint'
                    'tslint'
                    'typescript-config'
                ]
            }
        ]
        author: '$ghoti'
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
            'build with webpack 3'
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
    (path.join ghoti_root, "lib", "template", folderName))

(const commonPath = (folderName, commonName, ghoti_root) ->
    (path.join ghoti_root, "lib", "common", folderName, commonName))

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
        (const commonList = [])
        (re.path = (libPath re.path, ghoti_root))
        (for i in re.common
            (for j in i.commons
                (commonList.push commonPath(i.path, j, ghoti_root))))
        (re.common = commonList))
    (if re
    then re
    else null))

(export lib)
(export libList)
(export commonPath)