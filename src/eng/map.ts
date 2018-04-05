import {
    IMap,
    IMapConfig,
    TType,
} from './interface';
export default class Map {
    public static generate(config: IMapConfig): IMap {
        const end: IMap = this.generateEnd(config);
        const root: IMap = this.generateRoot(config, end);
        return root;
    }

    protected static generateRoot(config: IMapConfig, end: IMap): IMap {
        const type: TType = 'root';
        const next: IMap = this.generateNode(config, end);
        const root: IMap = {
            type,
            next,
            length: 0,
            cost: 0,
            loot: 0,
            reward: 1,
        };
        return root;
    }

    protected static generateEnd(config: IMapConfig): IMap {
        const type: TType = 'end';
        const length: number = this.random(config.lengthLimit);
        const cost: number = this.random(config.costLimit);
        let fulidCost: number | undefined;
        let mudCost: number | undefined;
        if (this.random(100) < config.fulidPercentage) {
            fulidCost = this.random(config.fulidLimit);
        }
        if (this.random(100) < config.mudPercentage) {
            mudCost = this.random(config.mudLimit);
        }
        const loot: number = this.random(config.lootLimit);
        const reward: number = this.random(config.rewardLimit);
        const node: IMap = {
            type,
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
        const type: TType = 'node';
        let next: IMap
        let second: IMap | undefined;
        let fulidCost: number | undefined;
        let mudCost: number | undefined;
        if (this.random(100) > config.endPercentage) {
            next = this.generateNode(config, end);
            if (this.random(100) < config.splitPercentage) {
                second = this.generateNode(config, end);
            }
        } else {
            next = end;
        }
        const length: number = this.random(config.lengthLimit);
        const cost: number = this.random(config.costLimit);
        if (this.random(100) < config.fulidPercentage) {
            fulidCost = this.random(config.fulidLimit);
        }
        if (this.random(100) < config.mudPercentage) {
            mudCost = this.random(config.mudLimit);
        }
        const loot: number = this.random(config.lootLimit);
        const reward: number = this.random(config.rewardLimit);
        const node: IMap = {
            type,
            next,
            second,
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
        return Math.round((Math.random() * 1000) % limit);
    }
}