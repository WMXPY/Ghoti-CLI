export type TType = 'root' | 'node' | 'end' | 'empty';

export interface IMap {
    type: TType;
    next?: IMap;
    second?: IMap;
    length: number;
    cost: number;
    fulidCost?: number;
    mudCost?: number;
    loot: number;
    reward: number;
}

export interface IMapConfig {
    splitPercentage: number;
    lengthLimit: number;
    endPercentage: number;
    costLimit: number;
    fulidPercentage: number;
    fulidLimit: number;
    mudPercentage: number;
    mudLimit: number;
    lootLimit: number;
    rewardLimit: number;
    nodeLimit: number;
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