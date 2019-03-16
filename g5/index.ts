/**
 * @author WMXPY
 * @namespace Ghoti
 * @description Index
 */

import * as Commander from "commander";

export default () => {
    Commander
        .version('5.0.0', '-v, --version')
        .parse(process.argv);
};

