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
            'q.ghoti'
        ]
        void
