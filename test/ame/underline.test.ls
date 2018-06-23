require! {
    'chai': { expect, assert }
    '../../src/ame/underline': { underline, puls, plus, minus, mergeGhoti, whatIsCurrent }
    './monk': { originGhotiConfig, ghotiConfig }
}

describe 'check underline dumb functions', ->
    specify 'check underline', ->
        const test = underline 'test'
        (expect <| test) .to.be.equal 'test'

    specify 'check puls', ->
        const test = puls 'test'
        (expect <| test) .to.be.equal 'test'

    specify 'check plus', ->
        const test = plus 'test'
        (expect <| test) .to.be.equal 'test'

    specify 'check minus', ->
        const test = minus 'test'
        (expect <| test) .to.be.equal 'test'

    ## dumb
    specify 'test mergeGhoti return', ->
        const test = minus 'test'
        (expect <| test) .to.be.equal 'test'

    specify 'test whatIsCurrent return switch', ->
        const test = whatIsCurrent {
            type: 'set'
        }
        (expect <| test) .to.be.equal 'Ghoti underline SET'
        