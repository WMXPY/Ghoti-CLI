/**
 * @author WMXPY
 * @fileoverview End entry
 */

import { deepClone } from '../func/deepclone';
import { IGameConfig, IMap, IMapConfig, IStatus } from './interface';
import * as Map from './map';
import pack from './pack';

export default class Controller {
    private ghoti: IGameConfig;
    private mapConfig: IMapConfig;
    private stat: IStatus;
    private _packList: pack[];

    public constructor(mapConfig: IMapConfig, ghoti?: IGameConfig) {
        if (ghoti) {
            this.ghoti = ghoti;
            this.stat = this.readFromConfig(ghoti);
        } else {
            let inits = this.init();
            this.ghoti = inits.ghoti;
            this.stat = inits.stat;
        }
        this.mapConfig = mapConfig;
        this._packList = [];
    }

    public get packList(): pack[] {
        return this._packList;
    }

    public addPack(packE: pack): Controller {
        this._packList.push(packE);
        return this;
    }

    public simulate(statE: IStatus): void {
        let map: IMap = Map.generate(this.mapConfig);
        Map.logMap(map);
        // let stat: IStatus = deepClone(statE);
        // stat = this.start(stat);
    }

    protected readFromConfig(ghoti: IGameConfig): IStatus {
        return {};
    }

    protected init(): { stat: IStatus; ghoti: IGameConfig } {
        return {
            stat: {},
            ghoti: {},
        };
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
}
