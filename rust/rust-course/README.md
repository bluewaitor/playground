# Rust语言圣经

[圣经地址](https://course.rs/about-book.html)  
[Rust语言实战](https://zh.practice.rs/why-exercise.html)  

## 安装

Mac使用Homebrew安装

```shell
brew install rustup # 安装
brew upgrade rustup # 更新

rustup update # 更新rustc和cargo版本

rustc -V # 查看rustc版本

cargo -V # 查看cargo版本
```

官方安装方法

```shell
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

要卸载 `Rust` 和 `rustup` ，在终端执行以下命令即可卸载

```shell
rustup self uninstall
```

## VSCode 插件

[rust-analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)  
[even-better-toml](https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml)  
[errorlens](https://marketplace.visualstudio.com/items?itemName=usernamehw.errorlens)  
[lldb](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)  

## 认识Cargo

创建新项目

```shell
# cd 到当前目录
cargo new hello_world
cd hello_world
```

运行项目

```shell
cargo run # 等同于下面两个命令

cargo build
 ./target/debug/hello_world
```

`release`版本

```shell
cargo run --release
cargo build --release
```

检查代码能否编译通过

```shell
cargo check
```
