require! {
    'chai': { expect, assert }
    '../../src/ame/checkGhoti': { checkGhoti, checkStructure }
    './monk': { originGhotiConfig, ghotiConfig }
}

describe 'test check ghoti util function', ->

    specify 'ghoti origin ghoti should always return true', ->
        const test = checkGhoti originGhotiConfig
        (expect <| test) .to.be.true

    specify 'ghoti project ghoti return true if valid', ->
        const test = checkGhoti ghotiConfig
        (expect <| test) .to.be.true

    specify 'ghoti project ghoti return true if some not required key is not valid', ->
        const ghoti = {
            type: 'project'
            version: '1.0.0'
            game: false
            underline: {
                active: false
            }
            template: 'test'
            sub: 'test'
            title: 'test'
            description: 'test'
            author: 'test'
            config: {}
            features: []
        }
        const test = checkGhoti ghoti
        (expect <| test) .to.be.true

    specify 'ghoti project ghoti return false if not valid', ->
        const ghoti = {
            type: 'project'
            version: '1.0.0'
            game: false
            underline: {
                active: false
            }
            template: 'test'
            title: 'test'
            description: 'test'
            author: 'test'
            config: {}
        }
        const test = checkGhoti ghoti
        (expect <| test) .to.be.false

    specify 'ghoti project ghoti return false if type is missed', ->
        const ghoti = {
            version: '1.0.0'
            game: false
            underline: {
                active: false
            }
            template: 'test'
            sub: 'test'
            title: 'test'
            description: 'test'
            author: 'test'
            config: {}
            features: []
        }
        const test = checkGhoti ghoti
        (expect <| test) .to.be.false

    specify 'checkstructure should return false if structure is missed', ->
        const ghoti = {
            components: []
            pages: []
            lambdas: []
            features: []
        }
        const test = checkStructure ghoti
        (expect <| test) .to.be.false

    specify 'checkstructure should return true if structure is valid', ->
        const ghoti = {
            components: []
            pages: []
            funcs: []
            lambdas: []
            features: []
        }
        const test = checkStructure ghoti
        (expect <| test) .to.be.true
