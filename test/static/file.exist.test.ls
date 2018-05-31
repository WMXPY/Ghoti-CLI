require! {
    path
    'chai': { expect, assert }
}

describe 'test file exist', ->

    specify 'test file exist', ->
        (expect <| 123) .to.be.equal 123
        void
