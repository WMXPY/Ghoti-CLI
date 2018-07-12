import { IGhotiConfig } from "../eng/interface";

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

export declare const getMaxLength: (list: string[]) => number;
export declare const faces: string[];

export declare const logSeparate: (length: number) => string;
export declare const logAlias: (command: string, original: string) => string;
export declare const br: () => string;
export declare const logHelp: (isEmpty?: boolean, env?: IEnv) => void;
export declare const logHelpMore: (env?: IEnv) => void;
export declare const logInfo: (command: string, env?: IEnv) => void;
export declare const logPostNPMInstall: (type: string, env?: IEnv) => void;

export declare const logSymbol: (mark: string, path: string) => () => void;
export declare const logFace: () => void;
export declare const logVersion: (env?: IEnv) => void;
export declare const logCommand: (command?: string, origin?: string) => () => void;
export declare const logStatus: (ghoti: IGhotiConfig, env?: IEnv) => void;
