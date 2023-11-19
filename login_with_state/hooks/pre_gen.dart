import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) async {
  await Future.wait([
    Process.run('bash', [
      '-c',
      'flutter pub add dev:flutter_gen_runner'
    ],),
    Process.run('bash', [
      '-c',
      'flutter pub add dev:build_runner'
    ],),
    Process.run('bash', [
      '-c',
      'flutter pub add dev:freezed'
    ],),
    Process.run('bash', [
      '-c',
      'dart pub add freezed_annotation'
    ],),
    Process.run('bash', [
      '-c',
      'dart pub add provider'
    ],)
  ]);
}
