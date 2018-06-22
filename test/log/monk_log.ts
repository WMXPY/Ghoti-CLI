import { faces } from "../../src/log/log";

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

export const isAnyOfFace = (face: string): boolean => {
    return faces.indexOf(face) !== -1;
};
