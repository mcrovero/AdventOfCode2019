import 'dart:io';

Future<void> main() async {
  final lines = File('input.txt').readAsLinesSync();
  var totalFuel = 0;
  for (var line in lines) {
    var mass = int.parse(line);
    do {
      mass = (mass / 3.0).floor() - 2;
      if (mass < 0) mass = 0;
      totalFuel += mass;
    } while (mass > 0);
  }
  print("totalFuel: $totalFuel");
}
