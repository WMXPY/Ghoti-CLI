/**
 * @author WMXPY
 * @namespace Ghoti
 * @description Index
 */

import * as Commander from "commander";

export default () => {
    Commander
        .version('5.0.0', '-v, --version');

    Commander
        .command('init <template> <target>')
        .action((template: string, action: string) => {
            console.log(template, action);
        });

    Commander.parse(process.argv);
};
