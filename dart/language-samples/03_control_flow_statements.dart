import '02_variables.dart';

void main() {
  if (year >= 2001) {
    print('21st century');
  } else {
    print('20th century');
  }

  for (var object in flybyObjects) {
    print(object);
  }

  for (int month = 1; month <= 12; month++) {
    print(month);
  }

  while (year < 2016) {
    year += 1;
  }

  print(year);
}

// result
/**
  20th century
  Jupiter
  Saturn
  Uranus
  Neptune
  1
  2
  3
  4
  5
  6
  7
  8
  9
  10
  11
  12
  2016
* */
