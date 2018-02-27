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
        '.ghoticonfig': [
            'configeration of ghoti project'
        ]
    if re[keyword]
    then re[keyword]
    else null

export whatis