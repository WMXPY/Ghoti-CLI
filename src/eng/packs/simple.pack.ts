import Pack from '../pack';
import { IStatus } from '../interface';
import { deepClone } from '../../func/deepclone';

export class simplePack extends Pack {
    public move(statE: IStatus): IStatus {
        const stat: IStatus = deepClone(statE);
        return stat;
    }
}
