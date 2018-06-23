import { deepClone } from '../../func/deepclone';
import { IStatus } from '../interface';
import Item from '../item';

export class SimpleItem extends Item {
    public move(statE: IStatus): IStatus {
        const stat: IStatus = deepClone(statE);
        return stat;
    }
}
