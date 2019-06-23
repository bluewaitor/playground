import { LinkedListNode } from './LinkedListNode';

export class LinkedList {
  head: LinkedListNode;

  constructor() {
    this.head = null;
  }

  append(value: any) {
    const newNode = new LinkedListNode(value);
    if (!this.head) {
      this.head = newNode;

      return this;
    }

    let current = this.head;

    while (current.next) {
      current = current.next;
    }

    current.next = newNode;

    return this;
  }

  toArray() {
    const nodes: Array<LinkedListNode> = [];
    let current = this.head;

    while (current) {
      nodes.push(current);
      current = current.next;
    }

    return nodes;
  }

  toString(callback?) {
    return this.toArray().map(node => node.toString(callback)).toString();
  }
}
