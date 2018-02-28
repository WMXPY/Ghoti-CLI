const postInstall = (type) ->
    const re = 
        'react-ssr': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-parcel-ssr': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-next-ssr': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-normal': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-lite': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            '$empty'
        ]
        'react-js': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-js-normal': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run feature [feature name]    > create a feature'
            'npm run lambda [function name]    > create a lambda function set'
            'npm run component [function name] > create a component'
            'npm run page [page name]          > create a page'
            'npm run func [function name]      > create a function set'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
        'react-unstructured': [
            '$empty'
            'Here is some useful npm shortcuts for your devlopment'
            '$empty'
            'npm run build                     > bundle application for production'
            'npm start                         > start development with localhost server'
            'npm test                          > test features by mocha'
            '$empty'
        ]
    if re[type]
    then re[type]
    else null

const whatis = (keyword) ->
    const re = 
        'react-ssr': [
            'react single page application'
            'use typescript'
            'test with mocha'
            'support server side render'
        ]
        'react-parcel-ssr': [
            'react single page application'
            'use typescript'
            'use parcel to pack'
            'test with mocha'
            'support server side render'
        ]
        'react-next-ssr': [
            'react single page application'
            'use typescript'
            'webpack 4'
            'test with mocha'
            'support server side render'
        ]
        'react': [
            'react single page application'
            'test with mocha'
            'use typescript'
        ]
        'react-normal': [
            'react single page application'
            'test with mocha'
            'use typescript'
        ]
        'react-lite': [
            'react single page application'
            'use typescript'
        ]
        'react-js': [
            'react single page application'
            'in development'
        ]
        'react-js-normal': [
            'react single page application'
            'in development'
        ]
        'react-unstructured': [
            'react single page application'
            'unstructured'
            'cannot use ghoti extend commands in the repo'
        ]
        'git-init': [
            'git init'
            'git add .'
            'git remote add origin https://github.com/somewhere.git'
            'git push -u origin master'
        ]
        '.ghoticonfig': [
            'configeration of ghoti project'
        ]
    if re[keyword]
    then re[keyword]
    else null

export whatis
export postInstall
