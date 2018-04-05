import { IGameConfig } from '../func/config';
import pack from './pack';

export default class controller {
    private ghoti: IGameConfig;
    private _packList: pack[];

    public constructor(ghoti: IGameConfig) {
        this.ghoti = ghoti;
        this._packList = [];
    }

    public get packList() {
        return this._packList;
    }

    public readFromConfig(config: IGameConfig) {

    }

    public addPack(pack: pack) {
        this._packList.push(pack);
    }

    public simulate() {

    }
};
