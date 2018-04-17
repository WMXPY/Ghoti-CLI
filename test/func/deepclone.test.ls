require! {
    'chai': { expect, assert }
    '../../src/func/deepclone': { deepClone }
}

describe 'test deepclone (only livescript)', ->

    const test = {}

    beforeEach ->
        test.before = 
            aBoolean: true
            aNumber: 16
            aString: 'hello'
            anArray: [
                'whooo'
                45
            ]
        void

    specify 'deepclone will not change element of object', ->
        const clonedBefore = deepClone test.before
        (expect <| test.before) .to.be.deep.equal clonedBefore

    specify 'deepclone will change element pointer', ->
        const clonedBefore = deepClone test.before
        (expect <| test.before) .to.be.not.equal clonedBefore
