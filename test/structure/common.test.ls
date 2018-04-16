require! {
    path
    'chai': { expect, assert }
    '../../src/structure/common': { commonAdd }
}

describe 'test common funcs of structures', ->

    specify 'test common suffix adding', ->
        (expect <| 'thing.a.ghoti') .to.be.equal 'thing.a.ghoti'
        (expect <| commonAdd 'thing.a') .to.be.equal 'thing.a.ghoti'