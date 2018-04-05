import { IStatus } from './interface';

export default class item {
    public constructor() {
    }

    public start(statE: IStatus): IStatus {
        return statE;
    }

    public move(statE: IStatus): IStatus {
        return statE;
    }
}
