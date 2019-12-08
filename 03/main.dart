import 'dart:io';

Future<void> main() async {
  final input = File('input.txt').readAsLinesSync();

  var coordinates1 = processPath(input[0].split(","));
  var coordinates2 = processPath(input[1].split(","));
  var minDist;

  // TODO: Find first all intersactions and then process those with the path finder
  List<String> intersections = [];
  for (String coord in coordinates1) {
    if (coordinates2.contains(coord)) {
      intersections.add(coord);
      var vals = coord.split('|').map((c) => int.parse(c)).toList();
      var manhattanDistance = vals[0].abs() + vals[1].abs();
      if (minDist == null || manhattanDistance < minDist) {
        minDist = manhattanDistance;
      }
    }
  }
}

List<String> processPath(List<String> instructions) {
  var x = 0;
  var y = 0;
  List<String> coordinates = [];
  addCoordinate() {
    coordinates.add('$x|$y');
  }

  for (String instruction in instructions) {
    var direction = instruction.substring(0, 1);
    var value = int.parse(instruction.substring(1, instruction.length));
    for (int i = 0; i < value; i++) {
      switch (direction) {
        case 'U':
          y -= 1;
          addCoordinate();
          break;
        case 'D':
          y += 1;
          addCoordinate();
          break;
        case 'R':
          x += 1;
          addCoordinate();
          break;
        case 'L':
          x -= 1;
          addCoordinate();
          break;
      }
    }
  }
  return coordinates;
}
