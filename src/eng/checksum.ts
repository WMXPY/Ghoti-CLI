import { log } from '../log/std';

export const encrypt = (str: string, xor: number = 35245, hex: number = 25): string => {
    const result: string[] = [];
    if ((typeof str !== 'string')
        || (typeof xor !== 'number')
        || (typeof hex !== 'number')) {
        log('| ERROR encrype');
        process.exit();
    }
    hex = hex <= 25 ? hex : hex % 25;
    for (let i: number = 0; i < str.length; i++) {
        // tslint:disable-next-line
        result.push(((str.charCodeAt(i) * 1) ^ xor).toString(hex));
    }
    return result.join(String.fromCharCode(hex + 97));
};

export const decrypt = (str: string, xor: number = 35245, hex: number = 25): string => {
    const result: string[] = [];
    if ((typeof str !== 'string')
        || (typeof xor !== 'number')
        || (typeof hex !== 'number')) {
        log('| ERROR encrype');
        process.exit();
    }
    hex = hex <= 25 ? hex : hex % 25;
    const char: string[] = str.split(String.fromCharCode(hex + 97));
    for (let i of char) {
        // tslint:disable-next-line
        result.push(String.fromCharCode((parseInt(i, hex) * 1) ^ xor));
    }
    return result.join('');
};
