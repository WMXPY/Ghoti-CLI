require! {
    'chai': { expect, assert }
    '../../src/log/getInput': { qeustionCreater }
}

describe 'test input getter', ->

    specify 'test question creater (boolean)', ->
        const test1 = qeustionCreater 'hello', true
        const result1 = 'hello (Y/N, default: Y) :\n=>> '
        (expect <| test1) .to.be.deep.equal result1
        const test2 = qeustionCreater 'hello', false
        const result2 = 'hello (Y/N, default: N) :\n=>> '
        (expect <| test2) .to.be.deep.equal result2

    specify 'test question creater (string)', ->
        const test1 = qeustionCreater 'hello', 'qucamber'
        const result1 = 'hello (default: "qucamber") :\n=>> '
        (expect <| test1) .to.be.deep.equal result1
        const test2 = qeustionCreater 'hello', ''
        const result2 = 'hello (default: "") :\n=>> '
        (expect <| test2) .to.be.deep.equal result2
    
    specify 'test question creater (none)', ->
        const test1 = qeustionCreater 'hello'
        const result1 = 'hello :\n=>> '
        (expect <| test1) .to.be.deep.equal result1
    
    specify 'test question creater (null)', ->
        const test1 = qeustionCreater 'hello', null
        const result1 = 'hello :\n=>> '
        (expect <| test1) .to.be.deep.equal result1
    
    specify 'test question creater (number)', ->
        const test1 = qeustionCreater 'hello', 0
        const result1 = 'hello (default: 0) :\n=>> '
        (expect <| test1) .to.be.deep.equal result1
        