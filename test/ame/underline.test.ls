require! {
    'chai': { expect, assert }
    '../../src/ame/underline': { underline, puls, plus, minus }
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
        