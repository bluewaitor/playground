# Operating Systems: Three Easy Pieces

[网址](https://pages.cs.wisc.edu/~remzi/OSTEP/)

[代码地址](https://github.com/remzi-arpacidusseau/ostep-code)

## 使用docker

```shell
docker run -it --rm --privileged --entrypoint /bin/sh -v $(pwd):/code bluewaitor/linuxc
```

## Intro

### 虚拟化CPU

```shell
gcc -o cpu cpu.c -Wall
./cpu A

./cpu A & ./cpu B & ./cpu C & ./cpu D & # 后台运行

# 结束方法
# 1. ps 查看进程
# kill -9 PID

# 2. fg 将进程放到前台
# ctrl + c 结束进程

# 3. 关掉整个terminal

```

### 虚拟化内存

docker启动容器必须添加--privileged才能修改ASLR

全局开启关闭ASLR(Address Space Layout Randomization)

关闭ASLR的方法

- sudo sysctl -w kernel.randomize_va_space=0
- echo 0 > /proc/sys/kernel/randomize_va_space

开启ASLR

- sudo sysctl -w kernel.randomize_va_space=2
- echo 2 > /proc/sys/kernel/randomize_va_space

局部关闭ASLR

执行的命令禁用ASLR `setarch $(uname -m) -R ./mem`

```shell
gcc -o mem mem.c -Wall
./mem

./mem &; ./mem &
# 这条命令在sh、bash中不能运行，在zsh中可以
# 原因是bash中&和;都是结束符，&是后台运行，;是前台
# https://superuser.com/questions/269429/why-did-after-return-an-unexpected-token-error-in-bash
# https://stackoverflow.com/questions/21917868/bash-unexpected-token-when-using/21918238#21918238
# shellcheck 可以检查出来 https://github-wiki-see.page/m/koalaman/shellcheck/wiki/SC1045
# 解决方法就是不需要分号，直接接第二条命令，因为第一条命令进入后台运行后，可以直接接第二条命令
```

## 并发

```shell
gcc -o threads threads.c -Wall -pthread
./threads 10000
./threads 200000 # 结果会出乎预料，后面会解释
```

## 持久化

```shell
gcc -o io io.c -Wall
```

## 设计目标

what an OS actually does: it takes physical resources, such as a CPU, memory, or disk, and virtualizes them. It handles tough and tricky issues related to concurrency. And it stores files persistently, thus making them safe over the long-term.
