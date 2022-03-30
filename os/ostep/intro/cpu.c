#include <stdio.h>
#include <stdlib.h>
#include "common.h"

int main(int argc, char* argv[]) {
    setbuf(stdout, NULL); // 使用nohup的时候，需要设置这个，否则会出现输出不到文件的情况

    if (argc != 2) {
        fprintf(stderr, "Usage: %s <string>\n", argv[0]);
        exit(1);
    }
    for (int i = 0; i < argc; i ++) {
        printf("argv[%d] = %s\n", i, argv[i]);
    }

    char *str = argv[1];

    while (1)
    {
        Spin(1);
        printf("%s\n", str);
    }

    return 0;
}
