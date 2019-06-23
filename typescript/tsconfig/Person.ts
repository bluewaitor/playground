export class Person {
  private _age: number;
  private _name: string;

  constructor(age: number, name: string) {
    this._age = age;
    this._name = name;
  }

  get age(): number {
    return this._age;
  }

  set age(value: number) {
    this._age = value;
  }

  get name(): string {
    return this._name;
  }

  set name(value: string) {
    this._name = value;
  }
}
