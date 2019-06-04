import '02_variables.dart';

int fibonacci(int n) {
  if (n == 0 || n == 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  var result = fibonacci(20);
  print(result);

  // 箭头函数
  flybyObjects.where((name) => name.contains('turn')).forEach(print);
}

// result
/**
  6765
  Saturn
*/
