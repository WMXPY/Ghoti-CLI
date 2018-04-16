require! {
    path
    'chai': { expect, assert }
    '../../src/static/fix': { findError }
}

describe 'test fix thing lookup', ->

    specify 'test fix thing loopup (temp)', ->
        (expect <| true) .to.be.equal true