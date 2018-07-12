require! {
    'chai': { expect, assert }
    '../../../src/ame/tilde/tilde': { executeTilde }
    '../../../src/log/log': { log }
    '../monk': { originGhotiConfig, ghotiConfig }
    '../../log/monk_log': { monk_log_read }
    '../../func/monk_read.ts': { monk_read }
}

const exitFunction = !->
    log 'exit'

describe 'test execute tilde', ->

    specify 'unknown suffix should exit the process', ->
        const test = !->
            executeTilde 'hello', {}, exitFunction
        const config = {
            tilde: []
        }

        (expect <| monk_log_read test, (JSON.stringify config)) .to.be.deep.equal [
            '    | Execute failed'
            '    | Error: Unknown command'
            'exit'
            'exit'
        ]
