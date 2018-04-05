import { IStatus, IGameConfig, IMap } from './interface';
import pack from './pack';
import Map from './map';
import { deepClone } from '../func/deepclone';

export default class controller {
    private ghoti: IGameConfig;
    private stat: IStatus;
    private _packList: pack[];

    public constructor(ghoti?: IGameConfig) {
        if (ghoti) {
            this.ghoti = ghoti;
            this.stat = this.readFromConfig(ghoti);
        } else {
            let { ghoti, stat } = this.init();
            this.ghoti = ghoti;
            this.stat = stat;
        }
        this._packList = [];
    }

    public get packList(): pack[] {
        return this._packList;
    }

    public addPack(pack: pack): controller {
        this._packList.push(pack);
        return this;
    }

    public simulate(statE: IStatus): void {
        let map: IMap = Map.generate();
        let stat: IStatus = deepClone(statE);
        stat = this.start(stat);
    }

    protected readFromConfig(ghoti: IGameConfig): IStatus {
        return {}
    }

    protected init(): { stat: IStatus; ghoti: IGameConfig } {
        return {
            stat: {},
            ghoti: {}
        }
    }

    protected start(statE: IStatus): IStatus {
        let stat: IStatus = deepClone(statE);
        for (let i of this._packList) {
            stat = i._start(stat);
        }
        return stat;
    }

    protected move(statE: IStatus): IStatus {
        let stat: IStatus = deepClone(statE);
        for (let i of this._packList) {
            stat = i._move(stat);
        }
        return stat;
    }
};
