import '07_classes.dart';

// Orbiter n. 人造卫星；盘旋物
class Orbiter extends Spacecraft {
  num altitude;
  Orbiter(String name, DateTime launchDate, this.altitude) : super(name, launchDate);
}
