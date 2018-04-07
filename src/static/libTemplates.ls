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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'React'
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
                    'public-template-outer'
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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'JavaScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'React'
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
        language: 'TypeScript'
        framework: 'VueJS'
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
        language: 'TypeScript'
        framework: 'None'
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
        language: 'TypeScript'
        framework: 'Discord.js'
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
        language: 'TypeScript'
        framework: 'Express'
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
            'go-server'
            'server-go'
            'go-normal'
            'normal-go'
        ]
        common: []
        author: '$ghoti'
        path: 'go-server'
        language: 'Go'
        framework: 'None'
        postLog: (defaultLogs [
            'Here are some useful shortcuts for your hacking'
            'You can always enter "npm run hint" for this message again'
            '$empty'
            'make feature [feature name]        > create a feature'
            '$empty'
            'make                               > bundle application for production'
            'make run                           > start server'
        ])
        whatis: [
            'golang serverside sample code'
            'build managed by makefile'
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
        language: 'TypeScript'
        framework: 'React'
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

export libs