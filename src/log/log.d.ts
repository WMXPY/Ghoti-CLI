export interface IEnv {
    mode: string;
    auto: boolean;
    test: boolean;
    fetch: boolean;
    output: boolean;
    debug: boolean;
    rename: boolean;
    yes: boolean;
    texture: string[];
}

export declare const logSeprate: (length: number) => string;
export declare const logAlias: (command: string, original: string) => string;
export declare const br: () => string;
export declare const logHelp: (isEmpty?: boolean, env?: IEnv) => void;
export declare const logHelpMore: (env?: IEnv) => void;
export declare const logInfo: (command: string, env?: IEnv) => void;
export declare const logPostNPMInstall: (type: string, env?: IEnv) => void;