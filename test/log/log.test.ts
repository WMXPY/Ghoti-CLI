import { expect, assert } from 'chai';
import {
    IEnv,
    logSeprate,
    logAlias,
    br,
    logHelp,
    logHelpMore,
    logInfo,
} from '../../src/log/log';
import monk_log from './monk_log';

const stringBilder = (str: string[]): string => {
    return str.join('\r\n');
}

describe('test common logging functions from log/log.ls', (): void => {

    let enviorment;

    beforeEach(() => {
        enviorment = {
            mode: 'test',
            auto: false,
            test: false,
            fetch: false,
            output: false,
            debug: false,
            rename: false,
            yes: false,
            texture: [],
        }
    });

    it('test log alias function', (): void => {
        const func = () => {
            logAlias('after', 'before');
        }
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            'Tips: "ghoti after" is an alia of "ghoti before"',
        ]);
    });

    it('test log br function', (): void => {
        const func = () => {
            br();
        }
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '\r\r\n',
        ]);
    });

    it('test log seprate function with argument 0', (): void => {
        const func = () => {
            logSeprate(0);
        }
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '',
        ]);
    });

    it('test log seprate function with argument numbers', (): void => {
        const func = () => {
            logSeprate(3);
            logSeprate(5);
            logSeprate(1);
        }
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '---',
            '-----',
            '-',
        ]);
    });

});
