require! {
    path
    'chai': { expect, assert }
    '../../src/static/compare': { compareName }
}

describe 'test name comparing', ->

    specify 'test name compare (pure string)', ->
        const test1 = 'happy'
        const com1 = 'happy'
        (expect <| (compareName test1, com1)) .to.be.equal true
        const test2 = 'happy'
        const com2 = 'Happy'
        (expect <| (compareName test2, com2)) .to.be.equal true
        const test3 = 'hapPY'
        const com3 = 'hAppy'
        (expect <| (compareName test3, com3)) .to.be.equal true
        const test4 = 'hAppy'
        const com4 = 'hBppy'
        (expect <| (compareName test4, com4)) .to.be.equal false

    specify 'test name compare (pure dash)', ->
        const test1 = '-'
        const com1 = '-'
        (expect <| (compareName test1, com1)) .to.be.equal true
        const test2 = '--'
        const com2 = '-'
        (expect <| (compareName test2, com2)) .to.be.equal true

    specify 'test name compare (dash and string)', ->
        const test1 = 'happy-tree'
        const com1 = 'happy-tree'
        (expect <| (compareName test1, com1)) .to.be.equal true
        const test2 = 'happy-tree-'
        const com2 = 'happytree-'
        (expect <| (compareName test2, com2)) .to.be.equal true
        const test3 = 'ha-pPY-tree-'
        const com3 = 'haPpy--tree-'
        (expect <| (compareName test3, com3)) .to.be.equal true
        const test4 = 'tree-happy'
        const com4 = 'haPpy--tree-'
        (expect <| (compareName test4, com4)) .to.be.equal false