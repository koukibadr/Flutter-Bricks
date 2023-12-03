import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Future.wait([
    Process.run('bash', ['-c', 'chmod ug+x scripts/*']),
    Process.run('bash', ['-c', 'git config core.hooksPath scripts']),
  ]);
}
