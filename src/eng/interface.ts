export interface IMap {

}

export interface IStatus {

}

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