require! {
    'chai': { expect, assert }
    '../../../src/ame/tilde/tilde': { excuteTilde }
    '../monk': { originGhotiConfig, ghotiConfig }
}

describe 'test tilde util functions', ->

    specify 'temp', ->
        (expect <| true) .to.be.true
