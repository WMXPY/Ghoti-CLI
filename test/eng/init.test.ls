require! {
    'chai': { expect, assert }
    '../../src/eng/init': { initDefaultMapgenSetting }
}

describe 'test eng init', ->

    specify 'inited setting should be same as default setting', ->
        const defaultSetting = 
            splitPercentage: 30
            lengthLimit: 45
            endPercentage: 20
            costLimit: 7
            fulidLimit: 15
            fulidPercentage: 15
            mudLimit: 10
            mudPercentage: 23
            lootLimit: 150
            rewardLimit: 135
            nodeMinum: 10
            nodeLimit: 100
        (expect <| initDefaultMapgenSetting!) .to.be.deep.equal defaultSetting
