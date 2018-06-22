import { faces } from "../../src/log/log";
import { IGhotiConfig } from "../../src/eng/interface";

export default function (fun: Function): string[] {
    const logTemp = console.log;
    const exitTemp = process.exit;
    const logHistory: string[] = [];

    console.log = function (...s: Array<any>) {
        const content = s.join(' ');
        logHistory.push(content);
    };
    (process.exit as any) = () => { };
    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    console.log = logTemp;
    process.exit = exitTemp;
    return logHistory;
}

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
