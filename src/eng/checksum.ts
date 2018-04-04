import { log } from '../log/std';

export const encrypt = (str: string, xor: number = 35245, hex: number = 25): string => {
    const result = [];
    if ((typeof str !== 'string')
        || (typeof xor !== 'number')
        || (typeof hex !== 'number')) {
        log('| ERROR encrype')
        process.exit!
    }
    hex = hex <= 25 ? hex : hex % 25;
    for (let i = 0; i < str.length; i++) {
        result.push(((str.charCodeAt(i) * 1) ^ xor).toString(hex));
    }
    return result.join(String.fromCharCode(hex + 97));
};

export const decrypt = (str: string, xor: number = 35245, hex: number = 25): string => {
    const result = [];
    if ((typeof str !== 'string')
        || (typeof xor !== 'number')
        || (typeof hex !== 'number')) {
        log('| ERROR encrype')
        process.exit!
    }
    hex = hex <= 25 ? hex : hex % 25;
    const char: string[] = str.split(String.fromCharCode(hex + 97));
    for (let i = 0; i < char.length; i++) {
        result.push(String.fromCharCode((parseInt(char[i], hex) * 1) ^ xor));
    }
    return result.join('');
};
