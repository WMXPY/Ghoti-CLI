import { IMap, IMapConfig } from './interface';

export default class Map {
    public static generate(config: IMapConfig): IMap {
        const end: IMap = this.generateEnd(config);
        const root: IMap = {
            type: 'root',
            next: this.generateNode(config, end),
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1,
        }
        return root;
    }

    protected static generateEnd(config: IMapConfig): IMap {
        const length = this.random(config.lengthLimit);
        const cost = this.random(config.costLimit);
        const fulidCost = this.random(100) < config.fulidPercentage ? this.random(config.fulidLimit) : 0;
        const mudCost = this.random(100) < config.mudPercentage ? this.random(config.mudLimit) : 0;
        const loot = this.random(config.lootLimit);
        const reward = this.random(config.rewardLimit);
        const node: IMap = {
            type: 'end',
            length,
            cost,
            fulidCost,
            mudCost,
            loot,
            reward,
        }
        return node;
    }

    protected static generateNode(config: IMapConfig, end: IMap): IMap {
        const type: 'root' | 'node' | 'end' = 'node';
        let next: IMap, second, third;
        if (this.random(100) < config.endPercentage) {
            next = this.generateNode(config, end);
            second = this.random(100) < config.splitPercentage ? this.generateNode(config, end) : void 0;
            if (second) {
                third = this.random(100) < config.triSplitPercentage ? this.generateNode(config, end) : void 0;
            }
        } else {
            next = end;
        }
        const length = this.random(config.lengthLimit);
        const cost = this.random(config.costLimit);
        const fulidCost = this.random(100) < config.fulidPercentage ? this.random(config.fulidLimit) : void 0;
        const mudCost = this.random(100) < config.mudPercentage ? this.random(config.mudLimit) : void 0;
        const loot = this.random(config.lootLimit);
        const reward = this.random(config.rewardLimit);
        const node: IMap = {
            type,
            next,
            second,
            third,
            length,
            cost,
            fulidCost,
            mudCost,
            loot,
            reward,
        }
        return node;
    }

    protected static random(limit: number): number {
        return Math.round(Math.random() * limit);
    }
}