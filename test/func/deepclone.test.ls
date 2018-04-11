require! {
    'chai': { expect, assert }
}

describe 'test deepclone', ->

    var before

    beforeEach ->
        before = 
            aBoolean: true
            aNumber: 16
            aString: 'hello'
            anArray: [
                'whooo'
                45
            ]

    specify 'deepclone will not change element of object', ->
        const clonedBefore = before
        (expect <| before) .to.be.deep.equal clonedBefore
