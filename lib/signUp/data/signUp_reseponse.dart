import 'package:freezed_annotation/freezed_annotation.dart';
part 'signUp_reseponse.freezed.dart';
part 'signUp_reseponse.g.dart';

@freezed
class SignupReseponse with _$SignupReseponse {
  const factory SignupReseponse({
    required int statusCode,
    required String message,
    required List<dynamic> data,
    required String timestamp,
  }) = _SignupReseponse;

  factory SignupReseponse.fromJson(Map<String, dynamic> json) => _$SignupReseponseFromJson(json);
}