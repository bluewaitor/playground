# Crafting Interpreters

## Link

[Crafting Interpreters][book]

[book]: http://www.craftinginterpreters.com

## 语言的组成部分

1. Scanning 扫描  
  扫描，也叫词法分析。接收线性字符串，将它们组合成单词，一般称为`token`，`token`通常会忽略掉空格、注释。`(`或`,`也是一个`token`

2. Parsing 解析  
  这一部分主要是获得语法。解析器通过一系列的`token`获得一棵`解析树`或`抽象语法树`，也叫`AST`。

3. Static analysis 静态分析  
  一般第一步是查找`identifier`的位置，并将它们连接在一起，这就是作用域发挥的地方。如果是静态语言，这里就是我们检查类型的地方。  
  添加额外属性。  
  将数据存储在一个数据表中。  
  到这里，我们称之为”前端“。  

4. Intermediate representations 中间表示层  
  中间表示层有个作用是只需要写一个前端，写多个后端，就可以支持多平台。还有一个作用是使语义更明显。

5. Optimization 优化  
  常见的优化是常量折叠。

6. Code generation 代码生成  
  生成机器可以运行的形式，CPU可以运行的指令集。是要生成真正CPU还是虚拟CPU执行的指令，我们有决定权。

7. Virtual machine 虚拟机  
  如果编译器生成字节码，没有CPU可以识别字节码。有两个选择，为每个目标编写一个小型编译器，将字节码转换为该机器的机器码。或者编写一个虚拟机。

8. Runtime 运行时  
  如果我们编译成机器码，我们可以直接执行，如果编译成字节码，则需要启动虚拟机并将程序加载到其中运行。
  