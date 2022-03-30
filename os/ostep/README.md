# Operating Systems: Three Easy Pieces

[网址](https://pages.cs.wisc.edu/~remzi/OSTEP/)

[代码地址](https://github.com/remzi-arpacidusseau/ostep-code)

## 使用docker

```shell
docker run -it --rm --entrypoint /bin/sh -v $(pwd):/code bluewaitor/linuxc
```

## Intro

```shell
gcc -o cpu cpu.c -Wall
./cpu A

./cpu A & ./cpu B & ./cpu C & ./cpu D & # 后台运行

# 结束方法
# ps 查看进程
kill -9 PID

# fg 将进程放到前台
# ctrl + c 结束进程

# 关掉整个terminal

```
