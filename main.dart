import 'dart:convert';
import 'dart:io';

Future<void> main() async {
  final lines = utf8.decoder
      .bind(File('input.txt').openRead())
      .transform(const LineSplitter());
  var totalFuel = 0;
  await for (var line in lines) {
    var mass = int.parse(line);
    var fuel = (mass / 3.0).floor() - 2;
    totalFuel += fuel;
  }
  print(totalFuel);
}
