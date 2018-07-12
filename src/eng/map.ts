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

export const generate = (config: IMapConfig): IMap => {
    const end: IMap = generateEnd(config);
    const root: IMap = generateRoot(config, end);
    return root;
};

export const logMap = (map: IMap, full?: boolean): void => {
    const renderList: IMap[][] = [[]];
    renderNode(map, renderList, renderList[0], true);
    let print = '';
    for (let i = 0; i < renderList.length; i++) {
        for (let j of renderList[i]) {
            if (full) {
                print += getSignal(j);
            } else if (renderList[i][0] && renderList[i][0].type === 'root') {
                print += getSignal(j);
            }
        }
        if (full && i < renderList.length - 1) {
            print += getSeparate();
        }
    }
    log(print);
};

export const renderNode = (map: IMap | undefined, renderList: IMap[][], currentList: IMap[], position: boolean): void => {
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
            renderNode(map.second, renderList, nextList, !position);
        }
        currentList.push(map);
        renderNode(map.next, renderList, currentList, position);
    }
};

export const getSignal = (map: IMap): string => {
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
};

export const generateRoot = (configE: IMapConfig, end: IMap): IMap => {
    const config = deepClone(configE);
    const type: TType = 'root';
    const next: IMap = generateNode(config, end);
    const root: IMap = {
        type,
        next,
        length: 0,
        cost: 0,
        loot: 0,
        reward: 1,
    };
    return root;
};

export const generateEnd = (config: IMapConfig): IMap => {
    const type: TType = 'end';
    const length: number = random(config.lengthLimit);
    const cost: number = random(config.costLimit);
    let fluidCost: number | undefined;
    let mudCost: number | undefined;
    if (random(100) < config.fluidPercentage) {
        fluidCost = random(config.fluidLimit);
    }
    if (random(100) < config.mudPercentage) {
        mudCost = random(config.mudLimit);
    }
    const loot: number = random(config.lootLimit);
    const reward: number = random(config.rewardLimit);
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
};

export const generateNode = (config: IMapConfig, end: IMap): IMap => {
    config.nodeLimit -= 1;
    config.nodeMinimum -= 1;
    const type: TType = 'node';
    let next: IMap;
    let second: IMap | undefined;
    let fluidCost: number | undefined;
    let mudCost: number | undefined;
    if (random(100) > config.endPercentage) {
        if (config.nodeLimit <= 0) {
            next = end;
        } else {
            next = generateNode(config, end);
        }
        if (random(100) < config.splitPercentage) {
            if (config.nodeLimit <= 0) {
                second = end;
            } else {
                second = generateNode(config, end);
            }
        }
    } else {
        if (config.nodeMinimum >= 0) {
            next = generateNode(config, end);
        } else {
            next = end;
        }
    }
    const length: number = random(config.lengthLimit);
    const cost: number = random(config.costLimit);
    if (random(100) < config.fluidPercentage) {
        fluidCost = random(config.fluidLimit);
    }
    if (random(100) < config.mudPercentage) {
        mudCost = random(config.mudLimit);
    }
    const loot: number = random(config.lootLimit);
    const reward: number = random(config.rewardLimit);
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
};

export const random = (limit: number): number => {
    return Math.round((Math.random() * 1000) % limit);
};
