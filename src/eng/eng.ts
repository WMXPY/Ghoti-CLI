import { IGameConfig } from '../func/config';
import IStatus from './status.interface';
import pack from './pack';
import { deepClone } from '../func/deepclone';

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

    protected start(statE: IStatus): IStatus {
        let stat = deepClone(statE);
        for (let i of this._packList) {
            stat = i._start(stat);
        }
        return stat;
    }

    protected move(statE: IStatus): IStatus {
        let stat = deepClone(statE);
        for (let i of this._packList) {
            stat = i._move(stat);
        }
        return stat;
    }
};
