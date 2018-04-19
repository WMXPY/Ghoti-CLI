import { expect, assert } from 'chai';
import logTest from './logTest';
import { log } from '../../src/log/std';

describe('test std function of log', (): void => {

    it('test log single line string', (): void => {
        let fun = () => {
            log('test');
        }
        const re = logTest(fun);
        expect(re).to.be.equal('test');
    });

    it('test log mutiple argument string', (): void => {
        let fun = () => {
            log('test', 'happy', 'treefriend');
        }
        const re = logTest(fun);
        expect(re).to.be.equal('test happy treefriend');
    });

    it('test log single line number', (): void => {
        let fun = () => {
            log(15);
        }
        const re = logTest(fun);
        expect(re).to.be.equal('15');
    });

    it('test log double line string', (): void => {
        let fun = () => {
            log('test');
            log('test');
        }
        const re = logTest(fun);
        expect(re).to.be.equal('test\ntest');
    });
});
