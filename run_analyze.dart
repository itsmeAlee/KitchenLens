import 'dart:io';

void main() async {
  final result = await Process.run('flutter', ['analyze', '--machine']);
  print('STDOUT:');
  print(result.stdout);
  print('STDERR:');
  print(result.stderr);
}
