import 'dart:io';

import '02_variables.dart';

Future main() async {

  // 1. 可以注释以下代码查看2的报错。
  var astronauts = 0;
  if (astronauts == 0) {
    throw StateError('No astronauts');
  }

  // 2
  try {
    for (var object in flybyObjects) {
      var description = await File('$object.txt').readAsString();
      print(description);
    }
  } on IOException catch (e) {
    print('Could not describe object: $e');
  } finally {
    flybyObjects.clear();
  }
}
