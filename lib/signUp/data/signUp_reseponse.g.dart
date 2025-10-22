// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signUp_reseponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignupReseponseImpl _$$SignupReseponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SignupReseponseImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
      timestamp: json['timestamp'] as String,
    );

Map<String, dynamic> _$$SignupReseponseImplToJson(
        _$SignupReseponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'data': instance.data,
      'timestamp': instance.timestamp,
    };
