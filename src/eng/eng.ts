import { IGameConfig } from '../func/config';
import { encrypt, decrypt } from './checksum';
import { log } from '../log/std';

export class frog {
    private ghoti: IGameConfig;
    public constructor(ghoti: IGameConfig) {
        this.ghoti = ghoti;
    }
};
