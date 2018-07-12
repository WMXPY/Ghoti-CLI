export type TType = 'root' | 'node' | 'end' | 'empty' | 'stopped';

export enum TYPE {
    ROOT = 'root',
    NODE = 'node',
    END = 'end',
    EMPTY = 'empty',
    STOPPED = 'stopped',
}

export interface IMap {
    type: TType;
    next?: IMap;
    second?: IMap;
    length: number;
    cost: number;
    fluidCost?: number;
    mudCost?: number;
    loot: number;
    reward: number;
}

export interface IMapConfig {
    splitPercentage: number;
    lengthLimit: number;
    endPercentage: number;
    costLimit: number;
    fluidPercentage: number;
    fluidLimit: number;
    mudPercentage: number;
    mudLimit: number;
    lootLimit: number;
    rewardLimit: number;
    nodeMinimum: number;
    nodeLimit: number;
}

export interface IStatus {
    status?: boolean;
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
    game?: boolean;
}
