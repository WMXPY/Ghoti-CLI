/**
 * @author WMXPY
 * @fileoverview Get Input in typescript
 */

import * as readline from 'readline';
import { error, ERROR_CODE } from './error';

export const logInline = (text: string) => {
    process.stdout.write(text);
    return text;
};

export const getInputUntilDoneCallback = (question: string, callback: (result: string[]) => void) => {
    getInputUntilDone(question).then((result: string[]) => {
        callback(result);
    });
};

export const getInputUntilDone = async (question: string): Promise<string[]> => {
    if (!question) {
        throw error(ERROR_CODE.TYPESCRIPT_REQUIRE_ARGUMENT);
    }
    const inputList: string[] = [];
    const rlConfig: readline.ReadLineOptions = {
        input: process.stdin,
        output: process.stdout,
        terminal: false,
    };
    const rl = readline.createInterface(rlConfig);
    const promiseQuestion = () => {
        return new Promise<string>((resolve: (answer: string) => void) => {
            rl.question('$ ', (answer: string) => {
                resolve(answer);
            });
        });
    };
    let stopper = false;
    while (!stopper) {
        const result: string = await promiseQuestion();
        if (!result || result.length <= 0) {
            stopper = true;
        } else {
            inputList.push(result);
        }
    }
    return inputList;
};
