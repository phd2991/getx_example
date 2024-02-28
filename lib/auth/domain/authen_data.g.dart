// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authen_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenDataImpl _$$AuthenDataImplFromJson(Map<String, dynamic> json) =>
    _$AuthenDataImpl(
      token: json['token'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
    );

Map<String, dynamic> _$$AuthenDataImplToJson(_$AuthenDataImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };
