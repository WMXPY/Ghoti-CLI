import { IStatus } from './interface';

export default class Item {
    public start(statE: IStatus): IStatus {
        return statE;
    }

    public move(statE: IStatus): IStatus {
        return statE;
    }
}
