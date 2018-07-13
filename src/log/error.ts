/**
 * @author WMXPY
 * @fileoverview Error Handler
 */

export enum ERROR_CODE {
    TYPESCRIPT_REQUIRE_ARGUMENT = 411,

    TEST_ERROR_CODE = 899,

    UNKNOWN_ERROR_CODE = 900,
}

const errorList: {
    [key: number]: string;
} = {
    411: 'Typescript file need static argument',
    899: 'Test error code',
    900: 'Unknown error code',
};

/**
 * return new error string object of target error code
 *
 * @param {number} code
 * @returns {Error}
 */
export const error = (code: number): Error => {
    let newError: Error = new Error();
    if (errorList[code]) {
        newError.message = code + ': ' + errorList[code];
        newError.name = errorList[code];
        (newError as any).code = code;
        return newError;
    }
    newError.message = code + ': ' + errorList[900];
    newError.name = errorList[900];
    (newError as any).code = 900;
    return newError;
};
