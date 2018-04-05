import item from './item';
import { IStatus } from './interface';
import { deepClone } from '../func/deepclone';

export default class pack {
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

    public addItem(item: item): pack {
        this._itemList.push(item);
        return this;
    }
}