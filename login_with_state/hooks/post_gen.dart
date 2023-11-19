import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Future.wait([
    Process.run('bash', ['-c', 'packages pub run build_runner build --delete-conflicting-outputs']),
  ]);
}
