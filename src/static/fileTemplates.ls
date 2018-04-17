const files = [
    {
        name: [
            'nginx-conf'
            'nginx-link'
            'nginx-config'
        ]
        author: '$ghoti'
        path: 'nginx'
        file: 'nginx.d.conf.ghoti'
        whatis: [
            'nginx sub config file'
            'support a sublink'
        ]
        replaces: [
            'uniqueName'
            'port'
            'url'
        ]
    }
    {
        name: [
            'nginx'
        ]
        author: '$ghoti'
        path: 'nginx'
        file: 'nginx.conf.ghoti'
        whatis: [
            'nginx main config file'
            '.conf file'
        ]
        replaces: []
    }
    {
        name: [
            'docker-node'
        ]
        author: '$ghoti'
        path: 'docker'
        file: 'dockerfile-node.ghoti'
        whatis: [
            'dockerfile for node'
        ]
        replaces: [
            'node-version'
            'port'
            'path'
            'excuteable'
        ]
    }
    {
        name: [
            'polymer-element'
        ]
        author: '$ghoti'
        path: 'polymer'
        file: 'component.html.ghoti'
        whatis: [
            'polymer 2.0 element file'
        ]
        replaces: [
            'title'
        ]
    }
]

export files