require! {
    'bkc': { bkc }
    '../log/log': { log }
}

const executeBkc = (lang) !->
    const re = bkc lang
    log re

export executeBkc
