import { expect } from 'chai';
import { logTable } from '../../src/log/logTable';
import monk_log from './monk_log';

describe('test table output displaying function', (): void => {

    it('test single row table', (): void => {
        const fun = () => {
            logTable([['a'], ['b']], 'title');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            "-----------",
            "|  title  |",
            "-----------",
            "| a       |",
            "| b       |",
            "-----------",
        ]);
    });

    it('test double row table', (): void => {
        const fun = () => {
            logTable([['a', 35], ['b', 35]], 'title', 'length');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            "----------------------",
            "|  title  |  length  |",
            "----------------------",
            "| a       | 35       |",
            "| b       | 35       |",
            "----------------------",
        ]);
    });

    it('test dumb input', (): void => {
        const fun = () => {
            logTable([['a'], ['b', 35]], 'title', 'length');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            "----------------------",
            "|  title  |  length  |",
            "----------------------",
            "| a       |",
            "| b       | 35       |",
            "----------------------",
        ]);
    });

    it('test error input', (): void => {
        const fun = () => {
            logTable([['a'], ['b', 35, '65']], 'title', 'length');
        };
        const re = monk_log(fun);
        expect(re).to.be.deep.equal([
            "TypeError: Cannot read property 'length' of undefined",
        ]);
    });
});
