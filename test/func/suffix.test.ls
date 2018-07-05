require! {
    path
    'chai': { expect, assert }
    '../../src/func/suffix': { changeSuffix }
}

describe 'test suffix', ->

    const test = {}

    beforeEach ->
        test.suffix = path.join 'a', 'b', 'cc', 'cc', '..', 'q.txt'
        void

    specify 'test change suffix', ->
        const suffixed = changeSuffix test.suffix
        (expect <| suffixed) .to.be.deep.equal [
            'a'
            'b'
            'cc'
            'q.txt.ghoti'
        ]
        void
    
    specify 'test suffix 2', ->
        const suffixed = changeSuffix path.join 'q', 'q', 'q'
        (expect <| suffixed) .to.be.deep.equal [
            'q'
            'q'
            'q'
        ]
        const suffixed2 = changeSuffix path.join 'q', 'q', 'q', 'q.js'
        (expect <| suffixed2) .to.be.deep.equal [
            'q'
            'q'
            'q'
            'q.js.ghoti'
        ]
        void
