export interface IGhotiConfig {
    // required
    type: 'project' | 'origin';
    version: string;
    game: boolean;
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

export interface IGameConfig {

}

export declare const getConfig: () => IGhotiConfig;
export declare const writeConfig: (config: IGhotiConfig) => boolean;
export declare const getGameConfig: () => IGameConfig;
export declare const writeGameConfig: (config: IGameConfig) => boolean;
export declare const readCLIConfig: () => IGhotiConfig;
export declare const writeCLIConfig: (config: IGhotiConfig) => boolean;
