require! {
    'chai': { expect, assert }
    '../../../src/ame/tilde/tilde': { executeTilde }
    '../monk': { originGhotiConfig, ghotiConfig }
}

describe 'test tilde util functions', ->

    specify 'temp', ->
        (expect <| true) .to.be.true
