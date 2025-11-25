// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryImpl _$$CountryImplFromJson(Map<String, dynamic> json) =>
    _$CountryImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      iso: json['iso'] as String,
      code: json['code'] as String,
      flag: json['flag'] as String?,
    );

Map<String, dynamic> _$$CountryImplToJson(_$CountryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'iso': instance.iso,
      'code': instance.code,
      'flag': instance.flag,
    };

_$CityImpl _$$CityImplFromJson(Map<String, dynamic> json) =>
    _$CityImpl(id: (json['id'] as num).toInt(), name: json['name'] as String);

Map<String, dynamic> _$$CityImplToJson(_$CityImpl instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};
