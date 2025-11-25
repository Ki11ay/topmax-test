// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl<T> _$$ApiResponseImplFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _$ApiResponseImpl<T>(
  status: json['status'] as String,
  message: json['message'] as String,
  statusCode: json['status_code'] as String,
  data: _$nullableGenericFromJson(json['data'], fromJsonT),
);

Map<String, dynamic> _$$ApiResponseImplToJson<T>(
  _$ApiResponseImpl<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'status_code': instance.statusCode,
  'data': _$nullableGenericToJson(instance.data, toJsonT),
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) => input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) => input == null ? null : toJson(input);

_$HomeDataImpl _$$HomeDataImplFromJson(Map<String, dynamic> json) =>
    _$HomeDataImpl(
      featuredJobs: json['featured_jobs'] as List<dynamic>? ?? const [],
      recentOpenings: json['recent_openings'] as List<dynamic>? ?? const [],
      disabilityJobs: json['disability_jobs'] as List<dynamic>? ?? const [],
      coursesForYou: json['courses_for_you'] as List<dynamic>? ?? const [],
      featuredJobsForYou:
          json['featured_jobs_for_you'] as List<dynamic>? ?? const [],
      matchedJobs: json['matched_jobs'] as List<dynamic>? ?? const [],
    );

Map<String, dynamic> _$$HomeDataImplToJson(_$HomeDataImpl instance) =>
    <String, dynamic>{
      'featured_jobs': instance.featuredJobs,
      'recent_openings': instance.recentOpenings,
      'disability_jobs': instance.disabilityJobs,
      'courses_for_you': instance.coursesForYou,
      'featured_jobs_for_you': instance.featuredJobsForYou,
      'matched_jobs': instance.matchedJobs,
    };

_$PaginationMetaImpl _$$PaginationMetaImplFromJson(Map<String, dynamic> json) =>
    _$PaginationMetaImpl(
      total: (json['total'] as num).toInt(),
      perPage: (json['per_page'] as num).toInt(),
      currentPage: (json['current_page'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      from: (json['from'] as num).toInt(),
      to: (json['to'] as num).toInt(),
      hasMorePages: json['has_more_pages'] as bool,
    );

Map<String, dynamic> _$$PaginationMetaImplToJson(
  _$PaginationMetaImpl instance,
) => <String, dynamic>{
  'total': instance.total,
  'per_page': instance.perPage,
  'current_page': instance.currentPage,
  'last_page': instance.lastPage,
  'from': instance.from,
  'to': instance.to,
  'has_more_pages': instance.hasMorePages,
};
