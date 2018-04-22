import { expect, assert } from 'chai';
import { readFileC } from '../../../src/func/fs/fileController';
import monk_read from '../monk_read';

const stringBilder = (str: string[]): string => {
    return str.join('\r\n');
}

describe('test read file c from fs/ func', (): void => {

    it('read anything', (): void => {
        const func = () => {
            readFileC('somefile.ts');
        }
        const content = monk_read(func);
        expect(content).to.be.deep.equal(stringBilder([
            'somefile.ts with utf8',
            'test file content',
            'test replaceable ${|replace|}',
            ''
        ]));
    });
});
