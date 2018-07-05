require! {
    '../../log/std': { log }
}

const enterType = (content) ->

    if content.length === 0 
    then return 'UNKNOWN'
    
    const CRSplited = content.split '\r'
    const LFSplited = content.split '\n'
    const difference = CRSplited.length - LFSplited.length

    if CRSplited.length === 1 && LFSplited.length === 1
    then return 'UNKNOWN'
    
    if difference === 0
    then 'CRLF'
    else
    then if difference < 0
    then 'LF'
    else 'CR'

export enterType