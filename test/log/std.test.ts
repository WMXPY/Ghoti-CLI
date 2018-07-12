import { expect } from 'chai';
import { dlog, log } from '../../src/log/std';
import monk_log from './monk_log';

describe('test std function of log', (): void => {

    it('test log single line string', (): void => {
        let fun = () => {
            log('test');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['test']);
    });

    it('test log multiple argument string', (): void => {
        let fun = () => {
            log('test', 'happy', 'treefriend');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['test happy treefriend']);
    });

    it('test log single line number', (): void => {
        let fun = () => {
            log(15);
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal(['15']);
    });

    it('test log double line string', (): void => {
        let fun = () => {
            log('test');
            log('test');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            'test',
            'test',
        ]);
    });
});

describe('test std function of debug log', (): void => {

    it('test dlog with normal log usage', (): void => {
        let fun = () => {
            dlog('test' as any);
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            '| Error usage of dlog',
        ]);
    });

    it('test dlog with normal log usage (multiple)', (): void => {
        let fun = () => {
            dlog('test' as any);
            dlog('test' as any);
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            '| Error usage of dlog',
            '| Error usage of dlog',
        ]);
    });

    it('test dlog with null environment', (): void => {
        let fun = () => {
            dlog({} as any, 'test');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([]);
    });

    it('test dlog with non debug environment', (): void => {
        let fun = () => {
            dlog({
                debug: false,
            } as any, 'test');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([]);
    });

    it('test dlog with debug environment, single argument', (): void => {
        let fun = () => {
            dlog({
                debug: true,
            } as any, 'test');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            'test',
        ]);
    });

    it('test dlog with debug environment, multiple argument', (): void => {
        let fun = () => {
            dlog({
                debug: true,
            } as any, 'test', 'test', 'haa');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            'test,test,haa',
        ]);
    });

    it('test dlog with debug environment, multiple call', (): void => {
        let fun = () => {
            dlog({
                debug: true,
            } as any, 'haa');
            dlog({
                debug: true,
            } as any, 'cucumber', 'haa');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            'haa',
            'cucumber,haa',
        ]);
    });
});
