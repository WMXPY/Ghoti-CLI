require! {
    path
    'chai': { expect, assert }
}

describe 'test wage in folder', ->

    specify 'test com init combiner', ->
        (expect <| 123) .to.be.equal 123
        void
