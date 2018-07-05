import { IGhotiConfig, IGameConfig } from '../eng/interface';

export declare const getConfig: () => IGhotiConfig;
export declare const writeConfig: (config: IGhotiConfig) => boolean;
export declare const getGameConfig: () => IGameConfig;
export declare const writeGameConfig: (config: IGameConfig) => boolean;
export declare const readCLIConfig: () => IGhotiConfig;
export declare const writeCLIConfig: (config: IGhotiConfig) => boolean;
