import 'dart:async';
import 'package:freezed_annotation/freezed_annotation.dart';
part '{{state_name.snakeCase()}}.freezed.dart';

@freezed
class {{state_name.pascalCase()}} with _${{state_name.pascalCase()}} {
  factory {{state_name.pascalCase()}}({
    @Default('') String email,
    @Default('') String password,
    @Default(false) bool emailError,
    @Default(false) bool passwordError,
    required StreamController apiStream,
  }) = _{{state_name.pascalCase()}};
}
