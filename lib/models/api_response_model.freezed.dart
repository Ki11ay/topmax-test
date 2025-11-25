// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object?) fromJsonT,
) {
  return _ApiResponse<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ApiResponse<T> {
  String get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_code')
  String get statusCode => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<T, ApiResponse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<T, $Res> {
  factory $ApiResponseCopyWith(
    ApiResponse<T> value,
    $Res Function(ApiResponse<T>) then,
  ) = _$ApiResponseCopyWithImpl<T, $Res, ApiResponse<T>>;
  @useResult
  $Res call({
    String status,
    String message,
    @JsonKey(name: 'status_code') String statusCode,
    T? data,
  });
}

/// @nodoc
class _$ApiResponseCopyWithImpl<T, $Res, $Val extends ApiResponse<T>>
    implements $ApiResponseCopyWith<T, $Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(
      _value.copyWith(
            status: null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String,
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
            statusCode: null == statusCode
                ? _value.statusCode
                : statusCode // ignore: cast_nullable_to_non_nullable
                      as String,
            data: freezed == data
                ? _value.data
                : data // ignore: cast_nullable_to_non_nullable
                      as T?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<T, $Res>
    implements $ApiResponseCopyWith<T, $Res> {
  factory _$$ApiResponseImplCopyWith(
    _$ApiResponseImpl<T> value,
    $Res Function(_$ApiResponseImpl<T>) then,
  ) = __$$ApiResponseImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({
    String status,
    String message,
    @JsonKey(name: 'status_code') String statusCode,
    T? data,
  });
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<T, $Res>
    extends _$ApiResponseCopyWithImpl<T, $Res, _$ApiResponseImpl<T>>
    implements _$$ApiResponseImplCopyWith<T, $Res> {
  __$$ApiResponseImplCopyWithImpl(
    _$ApiResponseImpl<T> _value,
    $Res Function(_$ApiResponseImpl<T>) _then,
  ) : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? statusCode = null,
    Object? data = freezed,
  }) {
    return _then(
      _$ApiResponseImpl<T>(
        status: null == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
        statusCode: null == statusCode
            ? _value.statusCode
            : statusCode // ignore: cast_nullable_to_non_nullable
                  as String,
        data: freezed == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                  as T?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$ApiResponseImpl<T> implements _ApiResponse<T> {
  const _$ApiResponseImpl({
    required this.status,
    required this.message,
    @JsonKey(name: 'status_code') required this.statusCode,
    this.data,
  });

  factory _$ApiResponseImpl.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$$ApiResponseImplFromJson(json, fromJsonT);

  @override
  final String status;
  @override
  final String message;
  @override
  @JsonKey(name: 'status_code')
  final String statusCode;
  @override
  final T? data;

  @override
  String toString() {
    return 'ApiResponse<$T>(status: $status, message: $message, statusCode: $statusCode, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl<T> &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    message,
    statusCode,
    const DeepCollectionEquality().hash(data),
  );

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<T, _$ApiResponseImpl<T>>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$ApiResponseImplToJson<T>(this, toJsonT);
  }
}

abstract class _ApiResponse<T> implements ApiResponse<T> {
  const factory _ApiResponse({
    required final String status,
    required final String message,
    @JsonKey(name: 'status_code') required final String statusCode,
    final T? data,
  }) = _$ApiResponseImpl<T>;

  factory _ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) = _$ApiResponseImpl<T>.fromJson;

  @override
  String get status;
  @override
  String get message;
  @override
  @JsonKey(name: 'status_code')
  String get statusCode;
  @override
  T? get data;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<T, _$ApiResponseImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

HomeData _$HomeDataFromJson(Map<String, dynamic> json) {
  return _HomeData.fromJson(json);
}

/// @nodoc
mixin _$HomeData {
  @JsonKey(name: 'featured_jobs')
  List<dynamic> get featuredJobs => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_openings')
  List<dynamic> get recentOpenings => throw _privateConstructorUsedError;
  @JsonKey(name: 'disability_jobs')
  List<dynamic> get disabilityJobs => throw _privateConstructorUsedError;
  @JsonKey(name: 'courses_for_you')
  List<dynamic> get coursesForYou => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_jobs_for_you')
  List<dynamic> get featuredJobsForYou => throw _privateConstructorUsedError;
  @JsonKey(name: 'matched_jobs')
  List<dynamic> get matchedJobs => throw _privateConstructorUsedError;

  /// Serializes this HomeData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res, HomeData>;
  @useResult
  $Res call({
    @JsonKey(name: 'featured_jobs') List<dynamic> featuredJobs,
    @JsonKey(name: 'recent_openings') List<dynamic> recentOpenings,
    @JsonKey(name: 'disability_jobs') List<dynamic> disabilityJobs,
    @JsonKey(name: 'courses_for_you') List<dynamic> coursesForYou,
    @JsonKey(name: 'featured_jobs_for_you') List<dynamic> featuredJobsForYou,
    @JsonKey(name: 'matched_jobs') List<dynamic> matchedJobs,
  });
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res, $Val extends HomeData>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredJobs = null,
    Object? recentOpenings = null,
    Object? disabilityJobs = null,
    Object? coursesForYou = null,
    Object? featuredJobsForYou = null,
    Object? matchedJobs = null,
  }) {
    return _then(
      _value.copyWith(
            featuredJobs: null == featuredJobs
                ? _value.featuredJobs
                : featuredJobs // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            recentOpenings: null == recentOpenings
                ? _value.recentOpenings
                : recentOpenings // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            disabilityJobs: null == disabilityJobs
                ? _value.disabilityJobs
                : disabilityJobs // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            coursesForYou: null == coursesForYou
                ? _value.coursesForYou
                : coursesForYou // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            featuredJobsForYou: null == featuredJobsForYou
                ? _value.featuredJobsForYou
                : featuredJobsForYou // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
            matchedJobs: null == matchedJobs
                ? _value.matchedJobs
                : matchedJobs // ignore: cast_nullable_to_non_nullable
                      as List<dynamic>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeDataImplCopyWith<$Res>
    implements $HomeDataCopyWith<$Res> {
  factory _$$HomeDataImplCopyWith(
    _$HomeDataImpl value,
    $Res Function(_$HomeDataImpl) then,
  ) = __$$HomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    @JsonKey(name: 'featured_jobs') List<dynamic> featuredJobs,
    @JsonKey(name: 'recent_openings') List<dynamic> recentOpenings,
    @JsonKey(name: 'disability_jobs') List<dynamic> disabilityJobs,
    @JsonKey(name: 'courses_for_you') List<dynamic> coursesForYou,
    @JsonKey(name: 'featured_jobs_for_you') List<dynamic> featuredJobsForYou,
    @JsonKey(name: 'matched_jobs') List<dynamic> matchedJobs,
  });
}

/// @nodoc
class __$$HomeDataImplCopyWithImpl<$Res>
    extends _$HomeDataCopyWithImpl<$Res, _$HomeDataImpl>
    implements _$$HomeDataImplCopyWith<$Res> {
  __$$HomeDataImplCopyWithImpl(
    _$HomeDataImpl _value,
    $Res Function(_$HomeDataImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? featuredJobs = null,
    Object? recentOpenings = null,
    Object? disabilityJobs = null,
    Object? coursesForYou = null,
    Object? featuredJobsForYou = null,
    Object? matchedJobs = null,
  }) {
    return _then(
      _$HomeDataImpl(
        featuredJobs: null == featuredJobs
            ? _value._featuredJobs
            : featuredJobs // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        recentOpenings: null == recentOpenings
            ? _value._recentOpenings
            : recentOpenings // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        disabilityJobs: null == disabilityJobs
            ? _value._disabilityJobs
            : disabilityJobs // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        coursesForYou: null == coursesForYou
            ? _value._coursesForYou
            : coursesForYou // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        featuredJobsForYou: null == featuredJobsForYou
            ? _value._featuredJobsForYou
            : featuredJobsForYou // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
        matchedJobs: null == matchedJobs
            ? _value._matchedJobs
            : matchedJobs // ignore: cast_nullable_to_non_nullable
                  as List<dynamic>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$HomeDataImpl implements _HomeData {
  const _$HomeDataImpl({
    @JsonKey(name: 'featured_jobs') final List<dynamic> featuredJobs = const [],
    @JsonKey(name: 'recent_openings')
    final List<dynamic> recentOpenings = const [],
    @JsonKey(name: 'disability_jobs')
    final List<dynamic> disabilityJobs = const [],
    @JsonKey(name: 'courses_for_you')
    final List<dynamic> coursesForYou = const [],
    @JsonKey(name: 'featured_jobs_for_you')
    final List<dynamic> featuredJobsForYou = const [],
    @JsonKey(name: 'matched_jobs') final List<dynamic> matchedJobs = const [],
  }) : _featuredJobs = featuredJobs,
       _recentOpenings = recentOpenings,
       _disabilityJobs = disabilityJobs,
       _coursesForYou = coursesForYou,
       _featuredJobsForYou = featuredJobsForYou,
       _matchedJobs = matchedJobs;

  factory _$HomeDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HomeDataImplFromJson(json);

  final List<dynamic> _featuredJobs;
  @override
  @JsonKey(name: 'featured_jobs')
  List<dynamic> get featuredJobs {
    if (_featuredJobs is EqualUnmodifiableListView) return _featuredJobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredJobs);
  }

  final List<dynamic> _recentOpenings;
  @override
  @JsonKey(name: 'recent_openings')
  List<dynamic> get recentOpenings {
    if (_recentOpenings is EqualUnmodifiableListView) return _recentOpenings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentOpenings);
  }

  final List<dynamic> _disabilityJobs;
  @override
  @JsonKey(name: 'disability_jobs')
  List<dynamic> get disabilityJobs {
    if (_disabilityJobs is EqualUnmodifiableListView) return _disabilityJobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_disabilityJobs);
  }

  final List<dynamic> _coursesForYou;
  @override
  @JsonKey(name: 'courses_for_you')
  List<dynamic> get coursesForYou {
    if (_coursesForYou is EqualUnmodifiableListView) return _coursesForYou;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_coursesForYou);
  }

  final List<dynamic> _featuredJobsForYou;
  @override
  @JsonKey(name: 'featured_jobs_for_you')
  List<dynamic> get featuredJobsForYou {
    if (_featuredJobsForYou is EqualUnmodifiableListView)
      return _featuredJobsForYou;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_featuredJobsForYou);
  }

  final List<dynamic> _matchedJobs;
  @override
  @JsonKey(name: 'matched_jobs')
  List<dynamic> get matchedJobs {
    if (_matchedJobs is EqualUnmodifiableListView) return _matchedJobs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_matchedJobs);
  }

  @override
  String toString() {
    return 'HomeData(featuredJobs: $featuredJobs, recentOpenings: $recentOpenings, disabilityJobs: $disabilityJobs, coursesForYou: $coursesForYou, featuredJobsForYou: $featuredJobsForYou, matchedJobs: $matchedJobs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataImpl &&
            const DeepCollectionEquality().equals(
              other._featuredJobs,
              _featuredJobs,
            ) &&
            const DeepCollectionEquality().equals(
              other._recentOpenings,
              _recentOpenings,
            ) &&
            const DeepCollectionEquality().equals(
              other._disabilityJobs,
              _disabilityJobs,
            ) &&
            const DeepCollectionEquality().equals(
              other._coursesForYou,
              _coursesForYou,
            ) &&
            const DeepCollectionEquality().equals(
              other._featuredJobsForYou,
              _featuredJobsForYou,
            ) &&
            const DeepCollectionEquality().equals(
              other._matchedJobs,
              _matchedJobs,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_featuredJobs),
    const DeepCollectionEquality().hash(_recentOpenings),
    const DeepCollectionEquality().hash(_disabilityJobs),
    const DeepCollectionEquality().hash(_coursesForYou),
    const DeepCollectionEquality().hash(_featuredJobsForYou),
    const DeepCollectionEquality().hash(_matchedJobs),
  );

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      __$$HomeDataImplCopyWithImpl<_$HomeDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HomeDataImplToJson(this);
  }
}

abstract class _HomeData implements HomeData {
  const factory _HomeData({
    @JsonKey(name: 'featured_jobs') final List<dynamic> featuredJobs,
    @JsonKey(name: 'recent_openings') final List<dynamic> recentOpenings,
    @JsonKey(name: 'disability_jobs') final List<dynamic> disabilityJobs,
    @JsonKey(name: 'courses_for_you') final List<dynamic> coursesForYou,
    @JsonKey(name: 'featured_jobs_for_you')
    final List<dynamic> featuredJobsForYou,
    @JsonKey(name: 'matched_jobs') final List<dynamic> matchedJobs,
  }) = _$HomeDataImpl;

  factory _HomeData.fromJson(Map<String, dynamic> json) =
      _$HomeDataImpl.fromJson;

  @override
  @JsonKey(name: 'featured_jobs')
  List<dynamic> get featuredJobs;
  @override
  @JsonKey(name: 'recent_openings')
  List<dynamic> get recentOpenings;
  @override
  @JsonKey(name: 'disability_jobs')
  List<dynamic> get disabilityJobs;
  @override
  @JsonKey(name: 'courses_for_you')
  List<dynamic> get coursesForYou;
  @override
  @JsonKey(name: 'featured_jobs_for_you')
  List<dynamic> get featuredJobsForYou;
  @override
  @JsonKey(name: 'matched_jobs')
  List<dynamic> get matchedJobs;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) {
  return _PaginationMeta.fromJson(json);
}

/// @nodoc
mixin _$PaginationMeta {
  int get total => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  int get from => throw _privateConstructorUsedError;
  int get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_more_pages')
  bool get hasMorePages => throw _privateConstructorUsedError;

  /// Serializes this PaginationMeta to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationMetaCopyWith<PaginationMeta> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationMetaCopyWith<$Res> {
  factory $PaginationMetaCopyWith(
    PaginationMeta value,
    $Res Function(PaginationMeta) then,
  ) = _$PaginationMetaCopyWithImpl<$Res, PaginationMeta>;
  @useResult
  $Res call({
    int total,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    int from,
    int to,
    @JsonKey(name: 'has_more_pages') bool hasMorePages,
  });
}

/// @nodoc
class _$PaginationMetaCopyWithImpl<$Res, $Val extends PaginationMeta>
    implements $PaginationMetaCopyWith<$Res> {
  _$PaginationMetaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? from = null,
    Object? to = null,
    Object? hasMorePages = null,
  }) {
    return _then(
      _value.copyWith(
            total: null == total
                ? _value.total
                : total // ignore: cast_nullable_to_non_nullable
                      as int,
            perPage: null == perPage
                ? _value.perPage
                : perPage // ignore: cast_nullable_to_non_nullable
                      as int,
            currentPage: null == currentPage
                ? _value.currentPage
                : currentPage // ignore: cast_nullable_to_non_nullable
                      as int,
            lastPage: null == lastPage
                ? _value.lastPage
                : lastPage // ignore: cast_nullable_to_non_nullable
                      as int,
            from: null == from
                ? _value.from
                : from // ignore: cast_nullable_to_non_nullable
                      as int,
            to: null == to
                ? _value.to
                : to // ignore: cast_nullable_to_non_nullable
                      as int,
            hasMorePages: null == hasMorePages
                ? _value.hasMorePages
                : hasMorePages // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$PaginationMetaImplCopyWith<$Res>
    implements $PaginationMetaCopyWith<$Res> {
  factory _$$PaginationMetaImplCopyWith(
    _$PaginationMetaImpl value,
    $Res Function(_$PaginationMetaImpl) then,
  ) = __$$PaginationMetaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int total,
    @JsonKey(name: 'per_page') int perPage,
    @JsonKey(name: 'current_page') int currentPage,
    @JsonKey(name: 'last_page') int lastPage,
    int from,
    int to,
    @JsonKey(name: 'has_more_pages') bool hasMorePages,
  });
}

/// @nodoc
class __$$PaginationMetaImplCopyWithImpl<$Res>
    extends _$PaginationMetaCopyWithImpl<$Res, _$PaginationMetaImpl>
    implements _$$PaginationMetaImplCopyWith<$Res> {
  __$$PaginationMetaImplCopyWithImpl(
    _$PaginationMetaImpl _value,
    $Res Function(_$PaginationMetaImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? perPage = null,
    Object? currentPage = null,
    Object? lastPage = null,
    Object? from = null,
    Object? to = null,
    Object? hasMorePages = null,
  }) {
    return _then(
      _$PaginationMetaImpl(
        total: null == total
            ? _value.total
            : total // ignore: cast_nullable_to_non_nullable
                  as int,
        perPage: null == perPage
            ? _value.perPage
            : perPage // ignore: cast_nullable_to_non_nullable
                  as int,
        currentPage: null == currentPage
            ? _value.currentPage
            : currentPage // ignore: cast_nullable_to_non_nullable
                  as int,
        lastPage: null == lastPage
            ? _value.lastPage
            : lastPage // ignore: cast_nullable_to_non_nullable
                  as int,
        from: null == from
            ? _value.from
            : from // ignore: cast_nullable_to_non_nullable
                  as int,
        to: null == to
            ? _value.to
            : to // ignore: cast_nullable_to_non_nullable
                  as int,
        hasMorePages: null == hasMorePages
            ? _value.hasMorePages
            : hasMorePages // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$PaginationMetaImpl implements _PaginationMeta {
  const _$PaginationMetaImpl({
    required this.total,
    @JsonKey(name: 'per_page') required this.perPage,
    @JsonKey(name: 'current_page') required this.currentPage,
    @JsonKey(name: 'last_page') required this.lastPage,
    required this.from,
    required this.to,
    @JsonKey(name: 'has_more_pages') required this.hasMorePages,
  });

  factory _$PaginationMetaImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaginationMetaImplFromJson(json);

  @override
  final int total;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  final int from;
  @override
  final int to;
  @override
  @JsonKey(name: 'has_more_pages')
  final bool hasMorePages;

  @override
  String toString() {
    return 'PaginationMeta(total: $total, perPage: $perPage, currentPage: $currentPage, lastPage: $lastPage, from: $from, to: $to, hasMorePages: $hasMorePages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationMetaImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.hasMorePages, hasMorePages) ||
                other.hasMorePages == hasMorePages));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    total,
    perPage,
    currentPage,
    lastPage,
    from,
    to,
    hasMorePages,
  );

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      __$$PaginationMetaImplCopyWithImpl<_$PaginationMetaImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationMetaImplToJson(this);
  }
}

abstract class _PaginationMeta implements PaginationMeta {
  const factory _PaginationMeta({
    required final int total,
    @JsonKey(name: 'per_page') required final int perPage,
    @JsonKey(name: 'current_page') required final int currentPage,
    @JsonKey(name: 'last_page') required final int lastPage,
    required final int from,
    required final int to,
    @JsonKey(name: 'has_more_pages') required final bool hasMorePages,
  }) = _$PaginationMetaImpl;

  factory _PaginationMeta.fromJson(Map<String, dynamic> json) =
      _$PaginationMetaImpl.fromJson;

  @override
  int get total;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  int get from;
  @override
  int get to;
  @override
  @JsonKey(name: 'has_more_pages')
  bool get hasMorePages;

  /// Create a copy of PaginationMeta
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationMetaImplCopyWith<_$PaginationMetaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
