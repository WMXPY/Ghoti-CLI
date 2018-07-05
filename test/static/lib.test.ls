require! {
    'chai': { expect, assert }
    '../../src/static/lib': { getOuter, libCommons, libList }
    './monks': { monk_read_json, monk_read_return_json }
}

describe 'test static lib parse functions', ->

    specify 'test get outer', ->
        const fun = ->
            getOuter!
        const content = JSON.parse monk_read_json fun
        (expect <| Boolean content.name) .to.be.true
        const leng = content.name.length
        (expect <| content.name.substring leng - 6, leng) .to.be.equal 'config'

    specify 'test liblist', ->
        const fun = ->
            libList!
        const content = monk_read_return_json fun
        (expect <| content.length) .to.be.at.least 11

    specify 'test liblist should have enough perproty', ->
        const fun = ->
            libList!
        const content = monk_read_return_json fun
        for i in content
            (expect <| i) .to.be.include.keys 'author'
            (expect <| i) .to.be.include.keys 'framework'
            (expect <| i) .to.be.include.keys 'language'
            (expect <| i) .to.be.include.keys 'location'
            (expect <| i) .to.be.include.keys 'name'