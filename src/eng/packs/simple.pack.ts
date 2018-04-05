import Pack from '../pack';
import IStatus from '../status.interface';
import { deepClone } from '../../func/deepclone';

export default class simplePack extends Pack {
    public move(statE: IStatus): IStatus {
        const stat: IStatus = deepClone(statE);
        return stat;
    }
}
