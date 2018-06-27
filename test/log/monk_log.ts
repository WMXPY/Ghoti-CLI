import * as fs from 'fs';

import { IGhotiConfig } from "../../src/eng/interface";
import { faces } from "../../src/log/log";

export const monk_log = (fun: () => any): string[] => {
    const logTemp = console.log;
    const exitTemp = process.exit;
    const logHistory: string[] = [];

    console.log = (...s: any[]) => {
        const content = s.join(' ');
        logHistory.push(content);
    };

    (process.exit as any) = (): void => {
        return void 0;
    };

    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    console.log = logTemp;
    process.exit = exitTemp;
    return logHistory;
};

export const monk_log_read = (fun: () => any, read?: string): string[] => {
    const logTemp = console.log;
    const exitTemp = process.exit;
    const readTemp = fs.readFileSync;
    const existTemp = fs.existsSync;
    const logHistory: string[] = [];

    console.log = (...s: any[]) => {
        const content = s.join(' ');
        logHistory.push(content);
    };

    (process.exit as any) = (): void => {
        return void 0;
    };

    (fs.readFileSync as any) = (): string => {
        return read || 'read';
    };

    (fs.existsSync as any) = (path: string): boolean => {
        return true;
    };

    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    console.log = logTemp;
    process.exit = exitTemp;
    (fs.readFileSync as any) = readTemp;
    (fs.existsSync as any) = existTemp;
    return logHistory;
};

export const ghotiConfig: IGhotiConfig = {
    type: 'project',
    version: '1.0.0',
    game: false,
    underline: {
        active: false,
    },
    template: 'test',
    sub: 'test',
    title: 'test',
    description: 'test',
    author: 'test',
    config: {},
    components: [],
    pages: [],
    funcs: [],
    lambdas: [],
    features: [],
};

export const isAnyOfFace = (face: string): boolean => {
    return faces.indexOf(face) !== -1;
};

export default monk_log;
