var name = '不露啊啊';
var year = 1991;
var antennaDiameter = 3.7; // antenna n. 天线；触角，触须  diameter n.直径
var flybyObjects = ['Jupiter', 'Saturn', 'Uranus', 'Neptune'];
// flyby n. 飞越；飞近探测；在低空飞过指定地点
// Jupiter n. 木星；朱庇特（罗马神话中的宙斯神）
// Saturn n. 土星；农业之神（罗马神话中的一个形象）
// Uranus n. 天王星
// Neptune n. [天]海王星；海神

var images = {
  'tags': ['saturn'],
  'url': '//path/to/saturn.png',
};

void main() {
  print(name);
  print(year);
  print(antennaDiameter);
  print(flybyObjects);
  print(images);
}

// result
/**
  不露啊啊
  1991
  3.7
  [Jupiter, Saturn, Uranus, Neptune]
  {tags: [saturn], url: //path/to/saturn.png}
*/
