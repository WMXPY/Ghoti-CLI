require! {
    'chai': { expect, assert }
    '../../src/static/static': { version }
}

describe 'test static version', ->

    specify 'test static version', ->
        (expect <| typeof version) .to.be.equal 'string'