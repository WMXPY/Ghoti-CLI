require! {
    'bkc': { bkc }
    '../log/log': { log }
}

const excuteBkc = (lang) !->
    const re = bkc lang
    log re

export excuteBkc
