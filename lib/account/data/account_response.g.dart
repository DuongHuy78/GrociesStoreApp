// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AccountResponseImpl _$$AccountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AccountResponseImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: AccountData.fromJson(json['data'] as Map<String, dynamic>),
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$AccountResponseImplToJson(
        _$AccountResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };

_$AccountDataImpl _$$AccountDataImplFromJson(Map<String, dynamic> json) =>
    _$AccountDataImpl(
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AccountDataImplToJson(_$AccountDataImpl instance) =>
    <String, dynamic>{
      'userInfo': instance.userInfo,
    };

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      userId: json['userId'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      displayName: json['displayName'] as String,
      description: json['description'] as String?,
      profilePic: json['profilePic'] as String,
      birthday: json['birthday'] as String?,
      phone: json['phone'] as String?,
      methodSignUp: json['methodSignUp'] as String,
      role: json['role'] as String,
      gender: (json['gender'] as num).toInt(),
      fcmToken: json['fcmToken'] as String?,
      scannedData: json['scannedData'] as List<dynamic>,
      createdAt: json['createdAt'] as String,
      isActive: json['isActive'] as bool,
      lastLogin: json['lastLogin'] as String?,
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'displayName': instance.displayName,
      'description': instance.description,
      'profilePic': instance.profilePic,
      'birthday': instance.birthday,
      'phone': instance.phone,
      'methodSignUp': instance.methodSignUp,
      'role': instance.role,
      'gender': instance.gender,
      'fcmToken': instance.fcmToken,
      'scannedData': instance.scannedData,
      'createdAt': instance.createdAt,
      'isActive': instance.isActive,
      'lastLogin': instance.lastLogin,
    };
