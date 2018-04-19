import { expect, assert } from 'chai';
import monk_log from './monk_log';
import { log } from '../../src/log/std';

describe('test std function of log', (): void => {

    it('test log single line string', (): void => {
        let fun = () => {
            log('test');
        }
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['test']);
    });

    it('test log mutiple argument string', (): void => {
        let fun = () => {
            log('test', 'happy', 'treefriend');
        }
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['test happy treefriend']);
    });

    it('test log single line number', (): void => {
        let fun = () => {
            log(15);
        }
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['15']);
    });

    it('test log double line string', (): void => {
        let fun = () => {
            log('test');
            log('test');
        }
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            'test',
            'test',
        ]);
    });
});
