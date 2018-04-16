require! {
    path
    'chai': { expect, assert }
    '../../../src/static/outer/achive': { parseLink }
}

describe 'test achive functions', ->

    specify 'test link parser (download)', ->
        const test1 = 'https://raw.githubusercontent.com/WMXPY/Ghoti-CLI-templates/master/dist/b.zip'
        const result1 = 'https://raw.githubusercontent.com/WMXPY/Ghoti-CLI-templates/master/dist/b.zip'
        (expect <| result1) .to.be.equal (parseLink test1).link
        (expect <| 'download') .to.be.equal (parseLink test1).next
        void

    specify 'test link parser (github)', ->
        const test1 = 'github://WMXPY/Ghoti-CLI-templates/master/dist/b.zip'
        const result1 = 'https://raw.githubusercontent.com/WMXPY/Ghoti-CLI-templates/master/dist/b.zip'
        (expect <| result1) .to.be.equal (parseLink test1).link
        (expect <| 'download') .to.be.equal (parseLink test1).next
        void

    specify 'test link parser (file)', ->
        const test1 = 'file://C:\\q.txt'
        const result1 = 'file://C:\\q.txt'
        (expect <| result1) .to.be.equal (parseLink test1).link
        (expect <| 'file') .to.be.equal (parseLink test1).next
        void