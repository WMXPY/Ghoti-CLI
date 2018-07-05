import { deepClone } from '../func/deepclone';
import { IStatus } from './interface';
import item from './item';

export default class Pack {
    private _itemList: item[];
    private size: number;

    public constructor(size: number) {
        this._itemList = [];
        this.size = size;
    }

    public _start(statE: IStatus): IStatus {
        let stat: IStatus = deepClone(statE);
        for (let i of this._itemList) {
            stat = i.start(stat);
        }
        stat = this.start(stat);
        return stat;
    }

    public start(statE: IStatus): IStatus {
        return statE;
    }

    public _move(statE: IStatus): IStatus {
        let stat: IStatus = deepClone(statE);
        for (let i of this._itemList) {
            stat = i.move(stat);
        }
        stat = this.move(stat);
        return stat;
    }

    public move(statE: IStatus): IStatus {
        return statE;
    }

    public addItem(itemE: item): Pack {
        this._itemList.push(itemE);
        return this;
    }
}
