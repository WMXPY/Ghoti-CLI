import { getGameConfig, writeGameConfig } from '../func/config';
import { log } from '../log/std';
import { decrypt, encrypt } from './checksum';
import { IGameConfig } from './interface';

import controller from './eng';
import { initDefaultMapgenSetting } from './init';
import item from './item';
import pack from './pack';

export const game = () => {
    const cont = new controller(initDefaultMapgenSetting());
    const stat = {};
    cont.simulate(stat);
    // return getGameConfig();
};

export default game;
