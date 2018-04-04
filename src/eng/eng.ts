import { IGhotiConfig } from '../func/config';
import { encrypt, decrypt } from './checksum';
import { log } from '../log/std';

export class frog {
    private ghoti: IGhotiConfig;
    public constructor(ghoti: IGhotiConfig) {
        this.ghoti = ghoti;
    }
};
