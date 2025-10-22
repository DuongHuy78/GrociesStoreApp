import 'package:freezed_annotation/freezed_annotation.dart';
part 'account_response.freezed.dart';
part 'account_response.g.dart';

@freezed
class AccountResponse with _$AccountResponse {
  const factory AccountResponse({
    required int statusCode,
    required String message,
    required AccountData data,
    required String timestamp,
  }) = _AccountResponse;

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);
}

@freezed
class AccountData with _$AccountData {
  const factory AccountData({
    required UserInfo userInfo,
  }) = _AccountData;

  factory AccountData.fromJson(Map<String, dynamic> json) =>
      _$AccountDataFromJson(json);
}

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required String userId,
    required String username,
    required String email,
    required String displayName,
    String? description,
    required String profilePic,
    String? birthday,
    String? phone,
    required String methodSignUp,
    required String role,
    required int gender,
    String? fcmToken,
    required List<dynamic> scannedData,
    required String createdAt,
    required bool isActive,
    String? lastLogin,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}