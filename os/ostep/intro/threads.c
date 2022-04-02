#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

// volatile 不稳定的;易挥发的;易变的;无定性的;无常性的;可能急剧波动的;易恶化的;易发散的
// volatile，变量可以被某些编译器未知的因素更改
// 变量counter随时都可以变化
// 每次读取都是重新从它所在内存读取，而不是从缓存中读取
volatile int counter = 0;
int loops;

void* worker(void* arg) {
    int i;
    for (i = 0; i < loops; i++) {
        counter++;
    }
    return NULL;
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "usage: %s <value>\n", argv[0]);
        exit(1);
    }
    loops = atoi(argv[1]);

    pthread_t p1, p2;
    printf("Initial value : %d\n", counter);

    pthread_create(&p1, NULL, worker, NULL);
    pthread_create(&p2, NULL, worker, NULL);
    pthread_join(p1, NULL);
    pthread_join(p2, NULL);
    printf("Final value : %d\n", counter);

    return 0;
}

// gcc -o threads threads.c -Wall -pthread
// -pthread，指定编译器使用POSIX线程API，不添加会报错

// 可以将线程视为与其他函数在同一内存中空间运行的函数，一次有多个函数处于活动状态