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
        const test1 = uniqueId 10
        const result1 = uniqueId 10
        (expect <| test1.length) .to.be.equal result1.length

    specify 'defatult uniqueid should be corrent length', ->
        const test1 = uniqueId!
        (expect <| test1.length) .to.be.equal 10

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
