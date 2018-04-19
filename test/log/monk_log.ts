export default function (fun: Function): string[] {
    const logTemp = console.log;
    const logHistory: string[] = [];

    console.log = function (...s: Array<any>) {
        const content = s.join(' ');
        logHistory.push(content);
    };
    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    console.log = logTemp;
    return logHistory;
}
