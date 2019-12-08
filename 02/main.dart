import 'dart:io';

Future<void> main() async {
  final input = File('input.txt').readAsStringSync();
  var ints = input.split(',').map((value) => int.parse(value)).toList();
  var maxTries = 100;
  bool run = true;
  for (int i = 0; i < maxTries; i++) {
    for (int j = 0; j < maxTries; j++) {
      var tempInts = List.from(ints);
      tempInts[1] = i;
      tempInts[2] = j;
      int currentIndex = 0;
      while (tempInts[currentIndex] != 99) {
        var pos1 = tempInts[currentIndex + 1];
        var pos2 = tempInts[currentIndex + 2];
        var pos3 = tempInts[currentIndex + 3];
        if (tempInts[currentIndex] == 1) {
          tempInts[pos3] = tempInts[pos1] + tempInts[pos2];
        } else if (ints[currentIndex] == 2) {
          tempInts[pos3] = tempInts[pos1] * tempInts[pos2];
        }
        currentIndex += 4;
      }
      if (tempInts[0] == 19690720) {
        print("noun: $i, verb: $j");
        run = false;
        break;
      }
    }
    if (!run) break;
  }
}
