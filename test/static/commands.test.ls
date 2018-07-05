
require! {
    path
    'chai': { expect, assert }
    '../../src/static/commands': { getCommand, getMaxLength_List, getMaxLength_Plus }
}

describe 'test static command founding and excuting', ->

    specify 'test command getting', ->
        (expect <| getCommand '_') .to.be.null
    
    specify 'test command getting 2', ->
        const test = getCommand 'info'
        (expect <| test) .to.be.include.keys 'arguments'
        (expect <| test) .to.be.include.keys 'command'
        (expect <| test) .to.be.include.keys 'info'
        (expect <| test) .to.be.include.keys 'more'
        (expect <| test) .to.be.include.keys 'plus'

    specify 'test max length of a list of command', ->
        const list = [
            getCommand 'info'
            getCommand 'new'
            getCommand 'version'
        ]
        const test = getMaxLength_List list
        (expect <| test) .to.be.equal 7

    specify 'test max length of a list of command 2', ->
        const list = [
            getCommand 'info'
        ]
        const test = getMaxLength_List list
        (expect <| test) .to.be.equal 4