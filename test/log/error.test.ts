/**
 * @fileoverview Util Error Test
 */

import { expect } from 'chai';
import { error, ERROR_CODE } from '../../src/log/error';

describe('test error util functions', (): void => {

    it('error a error code should return target error', (): void => {
        const result = error(ERROR_CODE.TEST_ERROR_CODE);
        expect(result.message).to.be.equal('899: Test error code');
    });

    it('a returned arrow should be throwable', (): void => {
        const result = error(ERROR_CODE.TEST_ERROR_CODE);
        const throwThis = () => {
            throw result;
        };
        expect(throwThis).to.be.throw("899: Test error code");
    });

    it('error a unknown error code should return 900 error', (): void => {
        const result = error(999);
        expect(result.message).to.be.equal('999: Unknown error code');
    });
});
