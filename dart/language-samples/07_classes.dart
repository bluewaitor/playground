class Spacecraft { // 宇宙飞船
  String name;
  DateTime launchDate;

  // 构造函数，语法糖赋值
  Spacecraft(this.name, this.launchDate) {
    // 初始化代码
  }

  Spacecraft.unLaunched(String name) : this(name, null);

  int get launchYear => launchDate?.year;

  void describe() {
    print('Spacecraft: $name');
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('UnLaunched');
    }
  }
}

void main() {
  // voyager n. 航海者，航行者
  var voyager = Spacecraft('Voyager I', DateTime(1997, 9, 5));
  voyager.describe();

  var voyager3 = Spacecraft.unLaunched('Voyager III');
  voyager3.describe();
}

// result

/**
  Spacecraft: Voyager I
  Launched: 1997 (21 years ago)
  Spacecraft: Voyager III
  UnLaunched
*/
