export class LinkedListNode {
  value: any;
  next: LinkedListNode;

  constructor(value, next = null) {
    this.value = value;
    this.next = next;
  }

  toString(callback?: (any) => void) {
    return callback ? callback(this.value) : `${this.value}`;
  }
}
