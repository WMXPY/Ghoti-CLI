require! {
    path
    'chai': { expect, assert }
}

describe 'test merge file', ->

    specify 'test merge', ->
        (expect <| 123) .to.be.equal 123
        void
