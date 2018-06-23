import { deepClone } from '../../func/deepclone';
import { IStatus } from '../interface';
import Pack from '../pack';

export class SimplePack extends Pack {
    public move(statE: IStatus): IStatus {
        const stat: IStatus = deepClone(statE);
        return stat;
    }
}
