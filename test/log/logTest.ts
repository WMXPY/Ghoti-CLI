export default function (f: Function, message: string) {
    const oldLog = console.log;
    let logText: string = '';

    console.log = function (s: string) {
        logText += s;
    };

    f();

    console.log = oldLog;

    return message === logText;
}
