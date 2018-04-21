require! {
    'chai': { expect, assert }
    '../../src/func/deepclone': { deepClone, uniqueId }
}

describe 'test deepclone (only livescript)', ->

    specify 'deepclone will not change element of object', ->
        const before = 
            aBoolean: true
            aNumber: 16
            aString: 'hello'
            anArray: [
                'whooo'
                45
            ]
        const clonedBefore = deepClone before
        (expect <| before) .to.be.deep.equal clonedBefore

    specify 'unique id should generate id with specific length, different', ->
        const test1 = uniqueId 10
        const result1 = uniqueId 10
        (expect <| test1) .to.be.not.equal result1

    specify 'unique id should generate id with specific same length', ->
        const testq = uniqueId 10
        const resultq = uniqueId 10
        (expect <| testq.length) .to.be.equal resultq.length

    specify 'unique id should generate id with specific same length (multiple)', ->
        for i to 10
        then
            const testq = uniqueId 10
            const resultq = uniqueId 10
            (expect <| testq.length) .to.be.equal resultq.length

    specify 'defatult uniqueid should be corrent length', ->
        const test1 = uniqueId!
        (expect <| test1.length) .to.be.equal 8

    specify 'deepclone will change element pointer', ->
        const before = 
            aBoolean: true
            aNumber: 16
            aString: 'hello'
            anArray: [
                'whooo'
                45
            ]
        const clonedBefore = deepClone before
        (expect <| before) .to.be.deep.equal clonedBefore
