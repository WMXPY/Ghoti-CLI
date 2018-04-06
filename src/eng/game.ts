import { getGameConfig, writeGameConfig } from '../func/config';
import { encrypt, decrypt } from './checksum';
import { log } from '../log/std';
import { IGameConfig } from './interface';
import pack from './pack';
import controller from './eng';
import item from './item';

export default function () {
    const cont = new controller({
        splitPercentage: 30,
        lengthLimit: 45,
        endPercentage: 20,
        costLimit: 7,
        fulidLimit: 15,
        fulidPercentage: 15,
        mudLimit: 10,
        mudPercentage: 23,
        lootLimit: 150,
        rewardLimit: 135,
        nodeLimit: 100,
    });
    const stat = {};
    cont.simulate(stat);
    // return getGameConfig();
}