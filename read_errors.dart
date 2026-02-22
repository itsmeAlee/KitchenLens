import 'dart:io';
import 'dart:convert';
void main() {
  var bytes = File('analyze_machine.txt').readAsBytesSync();
  print(utf8.decode(bytes, allowMalformed: true).replaceAll('\x00', ''));
}
