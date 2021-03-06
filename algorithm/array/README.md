# 数组

## 什么是数组？

数组是一种线性表数据结构。它用一组连续的内存空间，来存储一组具有相同类型的数据。

## 什么是线性表？

线性表是数据排成像一条线一样的结构。每个线性表上的数据最多只有前和后两个方向。除了数组，链表、队列、栈等也是线性表结构。

## 什么是非线性表？

与线性表相对立的概念是非线性表，比如二叉树、堆、图等。之所以叫非线性，是因为，在非线性表中，数据之间并不是简单的前后关系。

## 数组怎么实现随机访问

1. 因为是线性结构。
2. 连续的内存空间和相同类型的数据。

## 数组的优点与缺点

优点：根据下标访问速度快。随机访问时间复杂度O(1)。

缺点：插入和删除低效。时间复杂度为O(n)。

## 为什么大多数编程语言数组下标从0开始？

从数组的内存模型来看，其实下标应该是"偏移(offset)"，内存计算公式：`a[k]_address = base_address + k * type_size`，如果下标从1开始，则：`a[k]_address = base_address + (k -1) * type_size`，我们可以看到，如果从1开始的话，对于CPU来说，多了一次减法操作。
