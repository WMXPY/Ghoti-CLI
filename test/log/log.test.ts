import { expect } from 'chai';
import {
    br,
    getMaxLength,
    IEnv,
    logAlias,
    logCommand,
    logFace,
    logHelp,
    logHelpMore,
    logInfo,
    logSeparate,
    logStatus,
    logSymbol,
    logVersion,
} from '../../src/log/log';
import monk_log, { ghotiConfig, isAnyOfFace } from './monk_log';

export const stringBuilder = (str: string[]): string => {
    return str.join('\r\n');
};

describe('test common logging functions from log/log.ls', (): void => {

    let environment;
    beforeEach(() => {
        environment = {
            mode: 'test',
            auto: false,
            test: false,
            fetch: false,
            output: false,
            debug: false,
            rename: false,
            yes: false,
            texture: [],
        };
    });

    it('test log alias function', (): void => {
        const func = () => {
            logAlias('after', 'before');
        };

        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            'Tips: "ghoti after" is an alias of "ghoti before"',
        ]);
    });

    it('test log br function', (): void => {
        const func = () => {
            br();
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '\r\n',
        ]);
    });

    it('test log separate function with argument 0', (): void => {
        const func = () => {
            logSeparate(0);
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '',
        ]);
    });

    it('test log separate function with argument numbers', (): void => {
        const func = () => {
            logSeparate(3);
            logSeparate(5);
            logSeparate(1);
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '---',
            '-----',
            '-',
        ]);
    });

    it('test log separate function multiple times', (): void => {
        const func = () => {
            logSeparate(3);
            logSeparate(3);
            logSeparate(1);
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '---',
            '---',
            '-',
        ]);
    });
});

describe('test logs util functions', (): void => {

    it('test get maxlength', (): void => {
        const re = getMaxLength([
            'one',
            'manymany',
        ]);
        expect(re).to.be.equal(8);
    });
});

describe('test simple long log functions', (): void => {

    it('test log symbol', (): void => {
        let callback: () => void;
        const func = () => {
            callback = logSymbol('hello', 'world');
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            '🐟  > 💫  Ghoti-CLI SYMBOL hello of \"world\":',
            '--------------------------------------------',
        ]);

        const func2 = () => {
            callback();
        };
        const re2 = monk_log(func2);
        // tslint:disable-next-line
        expect(isAnyOfFace(re2[1])).to.be.true;
    });

    it('test log face', (): void => {
        const func = () => {
            logFace();
        };
        const re = monk_log(func);
        // tslint:disable-next-line
        expect(isAnyOfFace(re[0])).to.be.true;
    });

    it('test log version', (): void => {
        const func = () => {
            logVersion();
        };
        const re: string[] = monk_log(func);
        const face: string = (re.pop() as string);
        const version: string[] = re.splice(2, 1);
        expect(version[0].indexOf('version')).to.be.greaterThan(0);
        expect(re).to.be.deep.equal([
            "🐟  > 📜  Ghoti-CLI Version:",
            "----------------------------",
            "      * try to update > npm install -g ghoti-cli",
            "    | info    : for more info, try \"ghoti help\"",
            "----------------------------",
        ]);
        // tslint:disable-next-line
        expect(isAnyOfFace(face)).to.be.true;
    });

    it('test log command', (): void => {
        let callback: () => void;
        const func = () => {
            callback = logCommand();
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            "🐟  > 👟  Ghoti-CLI:",
            "--------------------",
        ]);

        const func2 = () => {
            callback();
        };
        const re2 = monk_log(func2);
        // tslint:disable-next-line
        expect(isAnyOfFace(re2[1])).to.be.true;
    });

    it('test log command - 2', (): void => {
        let callback: () => void;
        const func = () => {
            callback = logCommand('hello');
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            "🐟  > 👟  Ghoti-CLI:",
            "--------------------",
        ]);

        const func2 = () => {
            callback();
        };
        const re2 = monk_log(func2);
        // tslint:disable-next-line
        expect(isAnyOfFace(re2[1])).to.be.true;
    });

    it('test log command - 3', (): void => {
        let callback: () => void;
        const func = () => {
            callback = logCommand('hello', 'world');
        };
        const re = monk_log(func);
        expect(re).to.be.deep.equal([
            "🐟  > 👟  Ghoti-CLI:",
            "Tips: \"ghoti hello\" is an alias of \"ghoti world\"",
            "--------------------",
        ]);
        const func2 = () => {
            callback();
        };
        const re2 = monk_log(func2);
        // tslint:disable-next-line
        expect(isAnyOfFace(re2[1])).to.be.true;
    });

    it('test log status', (): void => {
        const func = () => {
            logStatus(ghotiConfig);
        };
        const re = monk_log(func);
        const face: string = (re.pop() as string);
        expect(re).to.be.deep.equal([
            "🐟  > 📇  Ghoti-CLI Status:",
            "---------------------------",
            "    | Info        : status is came from .ghoticonfig file",
            "    | Template    : test",
            "    | Author      : test",
            "    | Description : test",
            "    | CLI Version : 1.0.0",
            "    | Title       : test",
            "    | Components  : available count - 0",
            "    | Pages       : available count - 0",
            "    | Functions   : available count - 0",
            "    | Lambdas     : available count - 0",
            "---------------------------",
        ]);
        // tslint:disable-next-line
        expect(isAnyOfFace(face)).to.be.true;
    });
});
