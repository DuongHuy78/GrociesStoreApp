// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signUp_reseponse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SignupReseponse _$SignupReseponseFromJson(Map<String, dynamic> json) {
  return _SignupReseponse.fromJson(json);
}

/// @nodoc
mixin _$SignupReseponse {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<dynamic> get data => throw _privateConstructorUsedError;
  String get timestamp => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SignupReseponseCopyWith<SignupReseponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupReseponseCopyWith<$Res> {
  factory $SignupReseponseCopyWith(
          SignupReseponse value, $Res Function(SignupReseponse) then) =
      _$SignupReseponseCopyWithImpl<$Res, SignupReseponse>;
  @useResult
  $Res call(
      {int statusCode, String message, List<dynamic> data, String timestamp});
}

/// @nodoc
class _$SignupReseponseCopyWithImpl<$Res, $Val extends SignupReseponse>
    implements $SignupReseponseCopyWith<$Res> {
  _$SignupReseponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SignupReseponseImplCopyWith<$Res>
    implements $SignupReseponseCopyWith<$Res> {
  factory _$$SignupReseponseImplCopyWith(_$SignupReseponseImpl value,
          $Res Function(_$SignupReseponseImpl) then) =
      __$$SignupReseponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode, String message, List<dynamic> data, String timestamp});
}

/// @nodoc
class __$$SignupReseponseImplCopyWithImpl<$Res>
    extends _$SignupReseponseCopyWithImpl<$Res, _$SignupReseponseImpl>
    implements _$$SignupReseponseImplCopyWith<$Res> {
  __$$SignupReseponseImplCopyWithImpl(
      _$SignupReseponseImpl _value, $Res Function(_$SignupReseponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? data = null,
    Object? timestamp = null,
  }) {
    return _then(_$SignupReseponseImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SignupReseponseImpl implements _SignupReseponse {
  const _$SignupReseponseImpl(
      {required this.statusCode,
      required this.message,
      required final List<dynamic> data,
      required this.timestamp})
      : _data = data;

  factory _$SignupReseponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SignupReseponseImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  final List<dynamic> _data;
  @override
  List<dynamic> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  final String timestamp;

  @override
  String toString() {
    return 'SignupReseponse(statusCode: $statusCode, message: $message, data: $data, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SignupReseponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message,
      const DeepCollectionEquality().hash(_data), timestamp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SignupReseponseImplCopyWith<_$SignupReseponseImpl> get copyWith =>
      __$$SignupReseponseImplCopyWithImpl<_$SignupReseponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SignupReseponseImplToJson(
      this,
    );
  }
}

abstract class _SignupReseponse implements SignupReseponse {
  const factory _SignupReseponse(
      {required final int statusCode,
      required final String message,
      required final List<dynamic> data,
      required final String timestamp}) = _$SignupReseponseImpl;

  factory _SignupReseponse.fromJson(Map<String, dynamic> json) =
      _$SignupReseponseImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  List<dynamic> get data;
  @override
  String get timestamp;
  @override
  @JsonKey(ignore: true)
  _$$SignupReseponseImplCopyWith<_$SignupReseponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
