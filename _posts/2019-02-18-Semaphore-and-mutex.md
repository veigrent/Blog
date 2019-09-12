---
title: 信号量、互斥体和自旋锁
date: 2019-02-18
comment: semaphore、mutex、spinlock
---

代码中常常用到互斥锁，之前一直把互斥体叫信号量，虽然这么叫也没错。但是实际用法只是互斥体的用法。

## 信号量 Semaphore
信号量([Semaphore][1])是一个变量或者抽象的数据结构，可以用来协调不同进程([Process][2])间的数据对象，主要应用是共享内存方式的进程间通信。
信号量结构定义里包含原子操作锁，计数器，等待队列。信号量有P、V操作[1]，

[1]:https://en.wikipedia.org/wiki/Semaphore_(programming) "Semaphore (programming)"
[2]:https://en.wikipedia.org/wiki/Process_(computing) "Process (computing)"

