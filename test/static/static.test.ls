require! {
    'chai': { expect, assert }
    '../../src/static/static': { version }
}

describe 'test static version', ->

    specify 'test static version', ->
        (expect <| typeof version) .to.be.equal 'string'

    specify 'test static version format', ->
        const test1 = version.split ' ' 
        (expect <| test1.length) .to.be.equal 1

    specify 'test static version length', ->
        const test1 = version
        (expect <| test1.length) .to.be.greaterThan 4