require! {
    path
    'chai': { expect, assert }
}

describe 'test com init', ->

    specify 'test com init combiner', ->
        (expect <| 123) .to.be.equal 123
        void
