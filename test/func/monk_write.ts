import * as fs from 'fs';

export default function (fun: Function): string {
    const fsTemp = fs.writeFileSync;
    let fileContent = '';

    (fs.writeFileSync as any) = function (fileName: string, content: string, code: string) {
        fileContent = content;
    };
    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    (fs.writeFileSync as any) = fsTemp;
    return fileContent;
}
