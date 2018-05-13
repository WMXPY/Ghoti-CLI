require! {
    path
    'chai': { expect, assert }
    '../../../src/func/parser/format': { enterType }
}

describe 'test format identifier', ->

    specify 'test enterType finder (empty)', ->
        const test1 = enterType ''
        (expect <| test1) .to.be.equal 'UNKNOWN'
        void

    specify 'test enterType finder (unspaced)', ->
        const test1 = enterType 'test'
        (expect <| test1) .to.be.equal 'UNKNOWN'
        void
    
    specify 'test enterType finder (CRLF)', ->
        const test1 = enterType 'test\r\ntest\r\n'
        (expect <| test1) .to.be.equal 'CRLF'
        const test2 = enterType '\r\n'
        (expect <| test2) .to.be.equal 'CRLF'
        void
    
    specify 'test enterType finder (CR)', ->
        const test1 = enterType 'test\rdas\r\dsa\r'
        (expect <| test1) .to.be.equal 'CR'
        const test2 = enterType '\r\r'
        (expect <| test2) .to.be.equal 'CR'
        void

    specify 'test enterType finder (LF)', ->
        const test1 = enterType 'test\ndas\n\dsa\r'
        (expect <| test1) .to.be.equal 'LF'
        const test2 = enterType '\n'
        (expect <| test2) .to.be.equal 'LF'
        void