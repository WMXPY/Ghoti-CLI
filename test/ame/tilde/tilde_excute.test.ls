require! {
    'chai': { expect, assert }
    '../../../src/ame/tilde/tilde': { excuteTilde }
    '../../../src/log/log': { log }
    '../monk': { originGhotiConfig, ghotiConfig }
    '../../log/monk_log': { monk_log_read }
    '../../func/monk_read.ts': { monk_read }
}

const exitFunction = !->
    log 'exit'

describe 'test excute tilde', ->

    specify 'unknown suffix should exit the process', ->
        const test = !->
            excuteTilde 'hello', {}, exitFunction
        const config = {
            tilde: []
        }

        (expect <| monk_log_read test, (JSON.stringify config)) .to.be.deep.equal [
            '    | Excute failed'
            '    | Error: Unknown command'
            'exit'
            'exit'
        ]
