import Item from '../item';
import { IStatus } from '../interface';
import { deepClone } from '../../func/deepclone';

export class simpleItem extends Item {
    public move(statE: IStatus): IStatus {
        const stat: IStatus = deepClone(statE);
        return stat;
    }
}
