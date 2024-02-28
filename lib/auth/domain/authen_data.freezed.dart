// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authen_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthenData _$AuthenDataFromJson(Map<String, dynamic> json) {
  return _AuthenData.fromJson(json);
}

/// @nodoc
mixin _$AuthenData {
  String? get token => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthenDataCopyWith<AuthenData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenDataCopyWith<$Res> {
  factory $AuthenDataCopyWith(
          AuthenData value, $Res Function(AuthenData) then) =
      _$AuthenDataCopyWithImpl<$Res, AuthenData>;
  @useResult
  $Res call({String? token, String? firstName, String? lastName});
}

/// @nodoc
class _$AuthenDataCopyWithImpl<$Res, $Val extends AuthenData>
    implements $AuthenDataCopyWith<$Res> {
  _$AuthenDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_value.copyWith(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthenDataImplCopyWith<$Res>
    implements $AuthenDataCopyWith<$Res> {
  factory _$$AuthenDataImplCopyWith(
          _$AuthenDataImpl value, $Res Function(_$AuthenDataImpl) then) =
      __$$AuthenDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? token, String? firstName, String? lastName});
}

/// @nodoc
class __$$AuthenDataImplCopyWithImpl<$Res>
    extends _$AuthenDataCopyWithImpl<$Res, _$AuthenDataImpl>
    implements _$$AuthenDataImplCopyWith<$Res> {
  __$$AuthenDataImplCopyWithImpl(
      _$AuthenDataImpl _value, $Res Function(_$AuthenDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
  }) {
    return _then(_$AuthenDataImpl(
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthenDataImpl implements _AuthenData {
  _$AuthenDataImpl({this.token, this.firstName, this.lastName});

  factory _$AuthenDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthenDataImplFromJson(json);

  @override
  final String? token;
  @override
  final String? firstName;
  @override
  final String? lastName;

  @override
  String toString() {
    return 'AuthenData(token: $token, firstName: $firstName, lastName: $lastName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthenDataImpl &&
            (identical(other.token, token) || other.token == token) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token, firstName, lastName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthenDataImplCopyWith<_$AuthenDataImpl> get copyWith =>
      __$$AuthenDataImplCopyWithImpl<_$AuthenDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthenDataImplToJson(
      this,
    );
  }
}

abstract class _AuthenData implements AuthenData {
  factory _AuthenData(
      {final String? token,
      final String? firstName,
      final String? lastName}) = _$AuthenDataImpl;

  factory _AuthenData.fromJson(Map<String, dynamic> json) =
      _$AuthenDataImpl.fromJson;

  @override
  String? get token;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  @JsonKey(ignore: true)
  _$$AuthenDataImplCopyWith<_$AuthenDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
