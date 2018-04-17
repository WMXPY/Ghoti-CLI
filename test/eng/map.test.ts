import { expect } from 'chai';
import Map from '../../src/eng/map';
import { defaultSetting } from './init';

describe('test map generator', (): void => {

    it('test random number of map generator (type)', (): void => {
        expect(typeof Map.random(15)).to.be.equal('number');
    });

    it('test random number of map generator (range)', (): void => {
        expect(Map.random(15)).to.be.lessThan(15);
        expect(Map.random(15)).to.be.greaterThan(0);
    });

    it('test random number of map generator (random)', (): void => {
        expect(Map.random(15)).to.be.not.equal(Map.random(15));
    });

    it('test generate map', (): void => {
        const map = Map.generate(defaultSetting);
        console.log(map)
        expect(map).to.be.contain({
            type: 'root'
        });
        expect(map.next).to.be.contain({
            type: 'node'
        });
        expect(map).to.be.contain({
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1
        });
        expect(map.next).to.be.not.contain({
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1
        });
    })
});
