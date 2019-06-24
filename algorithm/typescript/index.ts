import { LinkedList } from './linked-list/LinkedList';
import { BubbleSort } from './sorting/BubbleSort';

const list = new LinkedList();

console.log(list.append(1).append(2).append(3).append(4).append(3).append(2).toString());

const bubbleSort = new BubbleSort();
const array = [3, 4, 9, 0, 1, 3, 5];
bubbleSort.sort(array);
console.log(array);
