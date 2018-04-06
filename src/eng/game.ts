import { getGameConfig, writeGameConfig } from '../func/config';
import { encrypt, decrypt } from './checksum';
import { log } from '../log/std';
import { IGameConfig } from './interface';

import { initDefaultMapgenSetting } from './init';
import pack from './pack';
import controller from './eng';
import item from './item';

export default function () {
    const cont = new controller(initDefaultMapgenSetting());
    const stat = {};
    cont.simulate(stat);
    // return getGameConfig();
}