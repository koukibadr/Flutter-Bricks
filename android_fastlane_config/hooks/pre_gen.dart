import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Process.run('bash', [
      '-c',
      'cd android/fastlane/ && rm Fastfile'
    ],);
}
