/**
 * @author WMXPY
 * @fileoverview Binding
 */

import * as ModuleAlias from 'module-alias';
import * as Path from 'path';

declare global {
    namespace NodeJS {
        // tslint:disable-next-line
        interface Global {
            Binding?: boolean;
        }
    }
}

if (!global.Binding) {
    const route: string[] = [];

    const here: string = Path.join(__dirname, ...route);
    ModuleAlias.addAliases({
        "#sudo": here,
        "#util": Path.join(here, '..', 'util'),
    });
    global.Binding = true;
}
