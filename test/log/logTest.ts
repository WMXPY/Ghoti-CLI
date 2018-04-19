export default function (fun: Function): string {
    const logTemp = console.log;
    let logText: string = '';

    console.log = function (...s: string[]) {
        if (logText.length > 0) logText += '\n';
        logText += s.join(' ');
    };
    fun();
    console.log = logTemp;
    return logText;
}
