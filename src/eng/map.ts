import {
    IMap,
    IMapConfig,
    TType,
} from './interface';
import {
    log,
} from '../log/std';
import {
    deepClone,
} from '../func/deepclone';

export default class Map {
    public static generate(config: IMapConfig): IMap {
        const end: IMap = this.generateEnd(config);
        const root: IMap = this.generateRoot(config, end);
        return root;
    }

    public static logMap(map: IMap, full?: boolean): void {
        const renderList: IMap[][] = [[]];
        this.renderNode(map, renderList, renderList[0], true);
        let print = '';
        for (let i = 0; i < renderList.length; i++) {
            for (let j = 0; j < renderList[i].length; j++) {
                if (full) {
                    print += this.getSignal(renderList[i][j]);
                } else if (renderList[i][0] && renderList[i][0].type === 'root') {
                    print += this.getSignal(renderList[i][j]);
                }
            }
            if (full && i < renderList.length - 1) {
                print += '\r\n';
            }
        }
        log(print);
    }

    public static renderNode(map: IMap | undefined, renderList: IMap[][], currentList: IMap[], position: boolean): void {
        if (!map) {
            return;
        } else {
            if (map.second) {
                let nextList;
                let emptyArr: any[] = new Array(currentList.length);
                (emptyArr as any).fill(void 0);
                if (position) {
                    renderList.push(emptyArr);
                    nextList = renderList[renderList.length - 1];
                } else {
                    renderList.unshift(emptyArr);
                    nextList = renderList[0];
                }
                this.renderNode(map.second, renderList, nextList, !position);
            }
            currentList.push(map);
            this.renderNode(map.next, renderList, currentList, position);
        }
    }

    public static getSignal(map: IMap): string {
        if (map) {
            switch (map.type) {
                case 'root':
                    return ' @-';
                case 'node':
                    return '---';
                case 'end':
                    return '-|#';
                case 'stoped':
                    return '|!|';
                default:
                    return '   ';
            }
        } else {
            return '   ';
        }
    }

    public static generateRoot(configE: IMapConfig, end: IMap): IMap {
        const config = deepClone(configE);
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

    public static generateEnd(config: IMapConfig): IMap {
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

    public static generateNode(config: IMapConfig, end: IMap): IMap {
        config.nodeLimit -= 1;
        config.nodeMinum -= 1;
        const type: TType = 'node';
        let next: IMap
        let second: IMap | undefined;
        let fulidCost: number | undefined;
        let mudCost: number | undefined;
        if (this.random(100) > config.endPercentage) {
            if (config.nodeLimit <= 0) {
                next = end;
            } else {
                next = this.generateNode(config, end);
            }
            if (this.random(100) < config.splitPercentage) {
                if (config.nodeLimit <= 0) {
                    second = end;
                } else {
                    second = this.generateNode(config, end);
                }
            }
        } else {
            if (config.nodeMinum >= 0) {
                next = this.generateNode(config, end);
            } else {
                next = end;
            }
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

    public static random(limit: number): number {
        return Math.round((Math.random() * 1000) % limit);
    }
}