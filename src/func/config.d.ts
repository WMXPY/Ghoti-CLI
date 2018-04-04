export interface IGhotiConfig {
    // required
    type: 'project' | 'origin';
    version: string;
    frog: {
        active: boolean;
    };
    underline: {
        active: boolean;
    };
    // optional
    template?: string;
    sub?: string;
    title?: string;
    description?: string;
    author?: string;
    config?: {
        router?: any;
        pack?: any;
        test?: any;
        style?: any;
        sub?: any;
    };
    components?: string[];
    pages?: string[];
    funcs?: string[];
    lambdas?: string[];
    features?: string[];
}
export declare const getConfig: () => IGhotiConfig;
export declare const writeConfig: (config: IGhotiConfig) => boolean;
export declare const readCLIConfig: () => IGhotiConfig;
export declare const writeCLIConfig: (config: IGhotiConfig) => boolean;