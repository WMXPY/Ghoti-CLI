import controller from './eng';
import item from './item';

export default class pack {
    private _controller: controller;
    private _itemList: item[];
    private size: number;

    public constructor(controller: controller, size: number) {
        this._controller = controller;
        this._itemList = [];
        this.size = size;
    }

    public get controller(): controller {
        return this._controller;
    }

    public get itemList(): item[] {
        return this._itemList;
    }

    public addItem(item: item) {
        this._itemList.push(item);
    }
}