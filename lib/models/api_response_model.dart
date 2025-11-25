import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_response_model.freezed.dart';
part 'api_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse({
    required String status,
    required String message,
    @JsonKey(name: 'status_code') required String statusCode,
    T? data,
  }) = _ApiResponse<T>;

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
}

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    @JsonKey(name: 'featured_jobs') @Default([]) List<dynamic> featuredJobs,
    @JsonKey(name: 'recent_openings') @Default([]) List<dynamic> recentOpenings,
    @JsonKey(name: 'disability_jobs') @Default([]) List<dynamic> disabilityJobs,
    @JsonKey(name: 'courses_for_you') @Default([]) List<dynamic> coursesForYou,
    @JsonKey(name: 'featured_jobs_for_you')
    @Default([])
    List<dynamic> featuredJobsForYou,
    @JsonKey(name: 'matched_jobs') @Default([]) List<dynamic> matchedJobs,
  }) = _HomeData;

  factory HomeData.fromJson(Map<String, dynamic> json) =>
      _$HomeDataFromJson(json);
}

@freezed
class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    required int total,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'last_page') required int lastPage,
    required int from,
    required int to,
    @JsonKey(name: 'has_more_pages') required bool hasMorePages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, dynamic> json) =>
      _$PaginationMetaFromJson(json);
}

