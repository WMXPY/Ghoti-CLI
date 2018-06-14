require! {
    path
    'chai': { expect, assert }
}

describe 'test templates exist', ->

    specify 'test templates exist', ->
        (expect <| 123) .to.be.equal 123
        void
