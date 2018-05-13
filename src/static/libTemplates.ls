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
            'ghoti-installable'
            'ghoti-install'
            'ghoti'
        ]
        author: '$ghoti'
        path: 'ghoti-installable'
        language: 'Any'
        framework: 'None'
        common: [
        ]
        replaces: [
            'language'
            'framework'
        ]
        postLog: (defaultLogs [
            'Start to work on a ghoti package and pack it to zip before upload'
            '$empty'
            'ghoti-cli support .zip file download, and .zip from github'
            'see Readme for more information'
        ])
        whatis: [
            'ghoti-cli package template'
        ]
    }
    {
        name: [
            'duo-electron'
            'electron'
        ]
        author: '$ghoti'
        path: 'duo-electron'
        language: 'TypeScript'
        framework: 'Electron'
        common: [
        ]
        replaces: [
            'git-id'
            'git-repo-name'
            'appid'
        ]
        postLog: (defaultLogs [
            'Start to work on a elctron project with react and typescript'
        ])
        whatis: [
            'electron duo package.json template'
        ]
    }
    {
        name: [
            'ghoti-remote-file'
            'ghoti-file-remote'
            'ghoti-file'
            'ghoti-remote'
            'ghotif'
        ]
        author: '$ghoti'
        path: 'ghoti-remote-file'
        language: 'Any'
        framework: 'None'
        common: [
        ]
        replaces: [
            'language'
            'filePath'
        ]
        postLog: (defaultLogs [
            'Start to work on a ghoti remtoe file and pack it to zip before upload'
            '$empty'
            'ghoti-cli support .zip file download, and .zip from github'
            'see Readme for more information'
        ])
        whatis: [
            'ghoti-cli remote file'
        ]
    }
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
        replaces: [
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
        replaces: [
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
            'test with mocha'
            'use typescript'
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
        replaces: [
        ]
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
        replaces: [
        ]
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
        replaces: [
        ]
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
        replaces: [
        ]
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
        replaces: [
        ]
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