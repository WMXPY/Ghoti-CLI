import * as fs from 'fs';

export const monk_read = (fun: () => void): string => {
    const fsTemp = fs.readFileSync;
    const fsExistTemp = fs.existsSync;
    let fileContent: string = '';

    (fs.existsSync as any) = () => true;
    (fs.readFileSync as any) = (fileName: string, code: string) => {
        fileContent += `${fileName} with ${code}`;
        fileContent += '\r\ntest file content';
        fileContent += '\r\ntest replaceable ${|replace|}';
        fileContent += '\r\n';
    };
    try {
        fun();
    } catch (err) {
        console.log(err);
    }
    (fs.readFileSync as any) = fsTemp;
    (fs.existsSync as any) = fsExistTemp;
    return fileContent;
};

export default monk_read;
