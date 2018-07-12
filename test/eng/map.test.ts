import { expect } from 'chai';
import Map from '../../src/eng/map';
import { defaultSetting } from './init';

import { } from 'mocha';

describe('test map generator', (): void => {

    it('test random number of map generator (type)', (): void => {
        expect(typeof Map.random(15)).to.be.equal('number');
    });

    it('test random number of map generator (range)', (): void => {
        expect(Map.random(15)).to.be.lessThan(16);
        expect(Map.random(15)).to.be.greaterThan(-1);
    });

    it('test random number of map generator (random)', (): void => {
        let same: number = 0;
        for (let i: number = 0; i < 10; i++) {
            if (Map.random(15) === Map.random(15)) {
                same++;
            }
        }
        expect(same).to.be.lessThan(6);
    });

    it('test generate map', (): void => {
        const map = Map.generate(defaultSetting);
        expect(map).to.be.contain({
            type: 'root',
        });
        expect(map.next).to.be.contain({
            type: 'node',
        });
        expect(map).to.be.contain({
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1,
        });
        expect(map.next).to.be.not.contain({
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1,
        });
    });
});
