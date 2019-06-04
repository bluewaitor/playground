import '07_classes.dart';

class MockSpaceship implements Spacecraft {
  @override
  DateTime launchDate;

  @override
  String name;

  @override
  void describe() {
    print('hello world');
  }

  @override
  int get launchYear => null;
}

abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class DescribableExtends extends Describable {
  @override
  void describe() {
    print('extends');
  }
}

class DescribableImplemented implements Describable {
  @override
  void describe() {
    print('implement');
  }

  @override
  void describeWithEmphasis() {
    print('---------');
    describe();
    print('---------');
  }

}

void main() {
  var mockSpaceship = MockSpaceship();
  mockSpaceship.describe();

  var describableExtends = DescribableExtends();
  describableExtends.describeWithEmphasis();

  var describableImplemented = DescribableImplemented();
  describableImplemented.describeWithEmphasis();
}

// dart没有interface关键字。替而代之，所有的类都可以隐式的定义接口。因此，你可以实现所有的类。

// result
/**
  hello world
  =========
  extends
  =========
  ---------
  implement
  ---------
*/
