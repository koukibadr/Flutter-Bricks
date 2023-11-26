import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  print('test');
  await Process.run('bash', [
      'cd android'
    ],);
  await Process.run('bash', [
      'fastlane init'
    ],);
  await Process.run('bash', [
      'cd fastlane'
    ],);
  await Process.run('bash', [
      'rm -f Fastfile.rb'
    ],);
}
