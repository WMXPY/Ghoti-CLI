require! {
    path
    'chai': { expect, assert }
    '../../src/structure/common': { commonAdd, comments }
}

describe 'test common funcs of structures', ->

    specify 'test common suffix adding', ->
        (expect <| 'thing.a.ghoti') .to.be.equal 'thing.a.ghoti'
        (expect <| commonAdd 'thing.a') .to.be.equal 'thing.a.ghoti'

    specify 'test common comments adding (temp)', ->
        (expect <| 'thing.a.ghoti') .to.be.equal 'thing.a.ghoti'
        (expect <| commonAdd 'thing.a') .to.be.equal 'thing.a.ghoti'

    specify 'test common comments adding (temp2)', ->
        (expect <| 'thing.a.ghoti') .to.be.equal 'thing.a.ghoti'
        (expect <| commonAdd 'thing.a') .to.be.equal 'thing.a.ghoti'