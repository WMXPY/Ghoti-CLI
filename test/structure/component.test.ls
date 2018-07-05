require! {
    path
    'chai': { expect, assert }
    '../../src/structure/component': { ghotiComponentFileName }
}

describe 'test structure - component', ->

    specify 'test component file name', ->
        const test1 = ghotiComponentFileName 'haha', true
        const result1 = 'haha.component.vue'
        (expect <| test1) .to.be.equal result1
        const test2 = ghotiComponentFileName 'haha', false
        const result2 = 'haha.component'
        (expect <| test2) .to.be.equal result2
