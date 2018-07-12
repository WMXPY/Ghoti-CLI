import {
    deepClone,
} from '../func/deepclone';
import {
    log,
} from '../log/std';
import {
    IMap,
    IMapConfig,
    TType,
} from './interface';

import {
    getSeparate,
} from '../ame/osDiff';

export default class Map {
    public static generate(config: IMapConfig): IMap {
        const end: IMap = Map.generateEnd(config);
        const root: IMap = Map.generateRoot(config, end);
        return root;
    }

    public static logMap(map: IMap, full?: boolean): void {
        const renderList: IMap[][] = [[]];
        Map.renderNode(map, renderList, renderList[0], true);
        let print = '';
        for (let i = 0; i < renderList.length; i++) {
            for (let j of renderList[i]) {
                if (full) {
                    print += Map.getSignal(j);
                } else if (renderList[i][0] && renderList[i][0].type === 'root') {
                    print += Map.getSignal(j);
                }
            }
            if (full && i < renderList.length - 1) {
                print += getSeparate();
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
                Map.renderNode(map.second, renderList, nextList, !position);
            }
            currentList.push(map);
            Map.renderNode(map.next, renderList, currentList, position);
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
                case 'stopped':
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
        const next: IMap = Map.generateNode(config, end);
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
        const length: number = Map.random(config.lengthLimit);
        const cost: number = Map.random(config.costLimit);
        let fluidCost: number | undefined;
        let mudCost: number | undefined;
        if (Map.random(100) < config.fluidPercentage) {
            fluidCost = Map.random(config.fluidLimit);
        }
        if (Map.random(100) < config.mudPercentage) {
            mudCost = Map.random(config.mudLimit);
        }
        const loot: number = Map.random(config.lootLimit);
        const reward: number = Map.random(config.rewardLimit);
        const node: IMap = {
            type,
            length,
            cost,
            fluidCost,
            mudCost,
            loot,
            reward,
        };
        return node;
    }

    public static generateNode(config: IMapConfig, end: IMap): IMap {
        config.nodeLimit -= 1;
        config.nodeMinimum -= 1;
        const type: TType = 'node';
        let next: IMap;
        let second: IMap | undefined;
        let fluidCost: number | undefined;
        let mudCost: number | undefined;
        if (Map.random(100) > config.endPercentage) {
            if (config.nodeLimit <= 0) {
                next = end;
            } else {
                next = Map.generateNode(config, end);
            }
            if (Map.random(100) < config.splitPercentage) {
                if (config.nodeLimit <= 0) {
                    second = end;
                } else {
                    second = Map.generateNode(config, end);
                }
            }
        } else {
            if (config.nodeMinimum >= 0) {
                next = Map.generateNode(config, end);
            } else {
                next = end;
            }
        }
        const length: number = Map.random(config.lengthLimit);
        const cost: number = Map.random(config.costLimit);
        if (Map.random(100) < config.fluidPercentage) {
            fluidCost = Map.random(config.fluidLimit);
        }
        if (Map.random(100) < config.mudPercentage) {
            mudCost = Map.random(config.mudLimit);
        }
        const loot: number = Map.random(config.lootLimit);
        const reward: number = Map.random(config.rewardLimit);
        const node: IMap = {
            type,
            next,
            second,
            length,
            cost,
            fluidCost,
            mudCost,
            loot,
            reward,
        };
        return node;
    }

    public static random(limit: number): number {
        return Math.round((Math.random() * 1000) % limit);
    }
}
