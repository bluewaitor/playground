import '07_classes.dart';

// 试点
class Piloted {
  // 宇航员
  int astronauts = 1;
  // crew n. 全体人员，全体船员；队，组
  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

class PilotedCraft extends Spacecraft with Piloted {
  PilotedCraft(String name, DateTime launchDate) : super(name, launchDate);
}

void main() {
  var pilotedCraft = PilotedCraft('不露', DateTime(2019, 5, 30));

  pilotedCraft.describeCrew();
}

// result
/**
  Number of astronauts: 1
*/
