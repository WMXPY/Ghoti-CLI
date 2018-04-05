import pack from './pack';
import controller from './eng';

export default class item {
    private _pack: pack;
    private _controller: controller;

    public constructor(pack: pack) {
        this._pack = pack;
        this._controller = pack.controller;
    }

    public get controller(): controller {
        return this._controller;
    }

    public get pack(): pack {
        return this._pack;
    }
}