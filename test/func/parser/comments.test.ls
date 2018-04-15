require! {
    path
    'chai': { expect, assert }
    '../../../src/func/parser/comments': { addComments, determinLanguage }
}

describe 'test comments adding parser', ->

    specify 'test file type determin1', ->
        const test1 = determinLanguage 'test.js'
        const test2 = determinLanguage 'test.ls'
        const test3 = determinLanguage 'test.ts'
        (expect <| test1) .to.be.equal 'javascript'
        (expect <| test2) .to.be.equal 'livescript'
        (expect <| test3) .to.be.equal 'typescript'
        void
    
    specify 'test file type determin2', ->
        const test1 = determinLanguage 'test.py'
        const test2 = determinLanguage 'test.test.js'
        const test3 = determinLanguage 'test.go'
        (expect <| test1) .to.be.equal 'python'
        (expect <| test2) .to.be.equal 'javascript'
        (expect <| test3) .to.be.equal 'golang'
        void
