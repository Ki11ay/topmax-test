// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'course_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Course _$CourseFromJson(Map<String, dynamic> json) {
  return _Course.fromJson(json);
}

/// @nodoc
mixin _$Course {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'featured_image')
  String? get featuredImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'course_category')
  String? get courseCategory => throw _privateConstructorUsedError;
  String? get price => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_free')
  int? get isFree => throw _privateConstructorUsedError;
  String? get level => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_certificate')
  @HasCertificateConverter()
  bool? get hasCertificate => throw _privateConstructorUsedError;
  @JsonKey(name: 'available_seats')
  int? get availableSeats => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  int? get companyId => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_enrolled')
  int? get totalEnrolled => throw _privateConstructorUsedError;
  @JsonKey(name: 'seats_percentage')
  double? get seatsPercentage => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_saved')
  bool? get isSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String? get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_price')
  String? get formattedPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_created_at')
  String? get formattedCreatedAt => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  List<String>? get highlights => throw _privateConstructorUsedError;

  /// Serializes this Course to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CourseCopyWith<Course> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CourseCopyWith<$Res> {
  factory $CourseCopyWith(Course value, $Res Function(Course) then) =
      _$CourseCopyWithImpl<$Res, Course>;
  @useResult
  $Res call({
    int id,
    String title,
    String? description,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'course_category') String? courseCategory,
    String? price,
    @JsonKey(name: 'is_free') int? isFree,
    String? level,
    @JsonKey(name: 'has_certificate')
    @HasCertificateConverter()
    bool? hasCertificate,
    @JsonKey(name: 'available_seats') int? availableSeats,
    @JsonKey(name: 'company_id') int? companyId,
    String? status,
    @JsonKey(name: 'total_enrolled') int? totalEnrolled,
    @JsonKey(name: 'seats_percentage') double? seatsPercentage,
    @JsonKey(name: 'company_name') String? companyName,
    String? location,
    @JsonKey(name: 'is_saved') bool? isSaved,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'formatted_price') String? formattedPrice,
    @JsonKey(name: 'formatted_created_at') String? formattedCreatedAt,
    String? type,
    List<String>? highlights,
  });
}

/// @nodoc
class _$CourseCopyWithImpl<$Res, $Val extends Course>
    implements $CourseCopyWith<$Res> {
  _$CourseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? featuredImage = freezed,
    Object? courseCategory = freezed,
    Object? price = freezed,
    Object? isFree = freezed,
    Object? level = freezed,
    Object? hasCertificate = freezed,
    Object? availableSeats = freezed,
    Object? companyId = freezed,
    Object? status = freezed,
    Object? totalEnrolled = freezed,
    Object? seatsPercentage = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? isSaved = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? formattedPrice = freezed,
    Object? formattedCreatedAt = freezed,
    Object? type = freezed,
    Object? highlights = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: freezed == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String?,
            featuredImage: freezed == featuredImage
                ? _value.featuredImage
                : featuredImage // ignore: cast_nullable_to_non_nullable
                      as String?,
            courseCategory: freezed == courseCategory
                ? _value.courseCategory
                : courseCategory // ignore: cast_nullable_to_non_nullable
                      as String?,
            price: freezed == price
                ? _value.price
                : price // ignore: cast_nullable_to_non_nullable
                      as String?,
            isFree: freezed == isFree
                ? _value.isFree
                : isFree // ignore: cast_nullable_to_non_nullable
                      as int?,
            level: freezed == level
                ? _value.level
                : level // ignore: cast_nullable_to_non_nullable
                      as String?,
            hasCertificate: freezed == hasCertificate
                ? _value.hasCertificate
                : hasCertificate // ignore: cast_nullable_to_non_nullable
                      as bool?,
            availableSeats: freezed == availableSeats
                ? _value.availableSeats
                : availableSeats // ignore: cast_nullable_to_non_nullable
                      as int?,
            companyId: freezed == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                      as int?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            totalEnrolled: freezed == totalEnrolled
                ? _value.totalEnrolled
                : totalEnrolled // ignore: cast_nullable_to_non_nullable
                      as int?,
            seatsPercentage: freezed == seatsPercentage
                ? _value.seatsPercentage
                : seatsPercentage // ignore: cast_nullable_to_non_nullable
                      as double?,
            companyName: freezed == companyName
                ? _value.companyName
                : companyName // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as String?,
            isSaved: freezed == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool?,
            startDate: freezed == startDate
                ? _value.startDate
                : startDate // ignore: cast_nullable_to_non_nullable
                      as String?,
            startTime: freezed == startTime
                ? _value.startTime
                : startTime // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            formattedPrice: freezed == formattedPrice
                ? _value.formattedPrice
                : formattedPrice // ignore: cast_nullable_to_non_nullable
                      as String?,
            formattedCreatedAt: freezed == formattedCreatedAt
                ? _value.formattedCreatedAt
                : formattedCreatedAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            type: freezed == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                      as String?,
            highlights: freezed == highlights
                ? _value.highlights
                : highlights // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CourseImplCopyWith<$Res> implements $CourseCopyWith<$Res> {
  factory _$$CourseImplCopyWith(
    _$CourseImpl value,
    $Res Function(_$CourseImpl) then,
  ) = __$$CourseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String title,
    String? description,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'course_category') String? courseCategory,
    String? price,
    @JsonKey(name: 'is_free') int? isFree,
    String? level,
    @JsonKey(name: 'has_certificate')
    @HasCertificateConverter()
    bool? hasCertificate,
    @JsonKey(name: 'available_seats') int? availableSeats,
    @JsonKey(name: 'company_id') int? companyId,
    String? status,
    @JsonKey(name: 'total_enrolled') int? totalEnrolled,
    @JsonKey(name: 'seats_percentage') double? seatsPercentage,
    @JsonKey(name: 'company_name') String? companyName,
    String? location,
    @JsonKey(name: 'is_saved') bool? isSaved,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'start_time') String? startTime,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'formatted_price') String? formattedPrice,
    @JsonKey(name: 'formatted_created_at') String? formattedCreatedAt,
    String? type,
    List<String>? highlights,
  });
}

/// @nodoc
class __$$CourseImplCopyWithImpl<$Res>
    extends _$CourseCopyWithImpl<$Res, _$CourseImpl>
    implements _$$CourseImplCopyWith<$Res> {
  __$$CourseImplCopyWithImpl(
    _$CourseImpl _value,
    $Res Function(_$CourseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? description = freezed,
    Object? featuredImage = freezed,
    Object? courseCategory = freezed,
    Object? price = freezed,
    Object? isFree = freezed,
    Object? level = freezed,
    Object? hasCertificate = freezed,
    Object? availableSeats = freezed,
    Object? companyId = freezed,
    Object? status = freezed,
    Object? totalEnrolled = freezed,
    Object? seatsPercentage = freezed,
    Object? companyName = freezed,
    Object? location = freezed,
    Object? isSaved = freezed,
    Object? startDate = freezed,
    Object? startTime = freezed,
    Object? createdAt = freezed,
    Object? formattedPrice = freezed,
    Object? formattedCreatedAt = freezed,
    Object? type = freezed,
    Object? highlights = freezed,
  }) {
    return _then(
      _$CourseImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: freezed == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String?,
        featuredImage: freezed == featuredImage
            ? _value.featuredImage
            : featuredImage // ignore: cast_nullable_to_non_nullable
                  as String?,
        courseCategory: freezed == courseCategory
            ? _value.courseCategory
            : courseCategory // ignore: cast_nullable_to_non_nullable
                  as String?,
        price: freezed == price
            ? _value.price
            : price // ignore: cast_nullable_to_non_nullable
                  as String?,
        isFree: freezed == isFree
            ? _value.isFree
            : isFree // ignore: cast_nullable_to_non_nullable
                  as int?,
        level: freezed == level
            ? _value.level
            : level // ignore: cast_nullable_to_non_nullable
                  as String?,
        hasCertificate: freezed == hasCertificate
            ? _value.hasCertificate
            : hasCertificate // ignore: cast_nullable_to_non_nullable
                  as bool?,
        availableSeats: freezed == availableSeats
            ? _value.availableSeats
            : availableSeats // ignore: cast_nullable_to_non_nullable
                  as int?,
        companyId: freezed == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                  as int?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        totalEnrolled: freezed == totalEnrolled
            ? _value.totalEnrolled
            : totalEnrolled // ignore: cast_nullable_to_non_nullable
                  as int?,
        seatsPercentage: freezed == seatsPercentage
            ? _value.seatsPercentage
            : seatsPercentage // ignore: cast_nullable_to_non_nullable
                  as double?,
        companyName: freezed == companyName
            ? _value.companyName
            : companyName // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as String?,
        isSaved: freezed == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool?,
        startDate: freezed == startDate
            ? _value.startDate
            : startDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        startTime: freezed == startTime
            ? _value.startTime
            : startTime // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        formattedPrice: freezed == formattedPrice
            ? _value.formattedPrice
            : formattedPrice // ignore: cast_nullable_to_non_nullable
                  as String?,
        formattedCreatedAt: freezed == formattedCreatedAt
            ? _value.formattedCreatedAt
            : formattedCreatedAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        type: freezed == type
            ? _value.type
            : type // ignore: cast_nullable_to_non_nullable
                  as String?,
        highlights: freezed == highlights
            ? _value._highlights
            : highlights // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CourseImpl implements _Course {
  const _$CourseImpl({
    required this.id,
    required this.title,
    this.description,
    @JsonKey(name: 'featured_image') this.featuredImage,
    @JsonKey(name: 'course_category') this.courseCategory,
    this.price,
    @JsonKey(name: 'is_free') this.isFree,
    this.level,
    @JsonKey(name: 'has_certificate')
    @HasCertificateConverter()
    this.hasCertificate,
    @JsonKey(name: 'available_seats') this.availableSeats,
    @JsonKey(name: 'company_id') this.companyId,
    this.status,
    @JsonKey(name: 'total_enrolled') this.totalEnrolled,
    @JsonKey(name: 'seats_percentage') this.seatsPercentage,
    @JsonKey(name: 'company_name') this.companyName,
    this.location,
    @JsonKey(name: 'is_saved') this.isSaved,
    @JsonKey(name: 'start_date') this.startDate,
    @JsonKey(name: 'start_time') this.startTime,
    @JsonKey(name: 'created_at') this.createdAt,
    @JsonKey(name: 'formatted_price') this.formattedPrice,
    @JsonKey(name: 'formatted_created_at') this.formattedCreatedAt,
    this.type,
    final List<String>? highlights,
  }) : _highlights = highlights;

  factory _$CourseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CourseImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String? description;
  @override
  @JsonKey(name: 'featured_image')
  final String? featuredImage;
  @override
  @JsonKey(name: 'course_category')
  final String? courseCategory;
  @override
  final String? price;
  @override
  @JsonKey(name: 'is_free')
  final int? isFree;
  @override
  final String? level;
  @override
  @JsonKey(name: 'has_certificate')
  @HasCertificateConverter()
  final bool? hasCertificate;
  @override
  @JsonKey(name: 'available_seats')
  final int? availableSeats;
  @override
  @JsonKey(name: 'company_id')
  final int? companyId;
  @override
  final String? status;
  @override
  @JsonKey(name: 'total_enrolled')
  final int? totalEnrolled;
  @override
  @JsonKey(name: 'seats_percentage')
  final double? seatsPercentage;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  final String? location;
  @override
  @JsonKey(name: 'is_saved')
  final bool? isSaved;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'start_time')
  final String? startTime;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  @JsonKey(name: 'formatted_price')
  final String? formattedPrice;
  @override
  @JsonKey(name: 'formatted_created_at')
  final String? formattedCreatedAt;
  @override
  final String? type;
  final List<String>? _highlights;
  @override
  List<String>? get highlights {
    final value = _highlights;
    if (value == null) return null;
    if (_highlights is EqualUnmodifiableListView) return _highlights;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Course(id: $id, title: $title, description: $description, featuredImage: $featuredImage, courseCategory: $courseCategory, price: $price, isFree: $isFree, level: $level, hasCertificate: $hasCertificate, availableSeats: $availableSeats, companyId: $companyId, status: $status, totalEnrolled: $totalEnrolled, seatsPercentage: $seatsPercentage, companyName: $companyName, location: $location, isSaved: $isSaved, startDate: $startDate, startTime: $startTime, createdAt: $createdAt, formattedPrice: $formattedPrice, formattedCreatedAt: $formattedCreatedAt, type: $type, highlights: $highlights)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CourseImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.featuredImage, featuredImage) ||
                other.featuredImage == featuredImage) &&
            (identical(other.courseCategory, courseCategory) ||
                other.courseCategory == courseCategory) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isFree, isFree) || other.isFree == isFree) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.hasCertificate, hasCertificate) ||
                other.hasCertificate == hasCertificate) &&
            (identical(other.availableSeats, availableSeats) ||
                other.availableSeats == availableSeats) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalEnrolled, totalEnrolled) ||
                other.totalEnrolled == totalEnrolled) &&
            (identical(other.seatsPercentage, seatsPercentage) ||
                other.seatsPercentage == seatsPercentage) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.formattedPrice, formattedPrice) ||
                other.formattedPrice == formattedPrice) &&
            (identical(other.formattedCreatedAt, formattedCreatedAt) ||
                other.formattedCreatedAt == formattedCreatedAt) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(
              other._highlights,
              _highlights,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    title,
    description,
    featuredImage,
    courseCategory,
    price,
    isFree,
    level,
    hasCertificate,
    availableSeats,
    companyId,
    status,
    totalEnrolled,
    seatsPercentage,
    companyName,
    location,
    isSaved,
    startDate,
    startTime,
    createdAt,
    formattedPrice,
    formattedCreatedAt,
    type,
    const DeepCollectionEquality().hash(_highlights),
  ]);

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      __$$CourseImplCopyWithImpl<_$CourseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CourseImplToJson(this);
  }
}

abstract class _Course implements Course {
  const factory _Course({
    required final int id,
    required final String title,
    final String? description,
    @JsonKey(name: 'featured_image') final String? featuredImage,
    @JsonKey(name: 'course_category') final String? courseCategory,
    final String? price,
    @JsonKey(name: 'is_free') final int? isFree,
    final String? level,
    @JsonKey(name: 'has_certificate')
    @HasCertificateConverter()
    final bool? hasCertificate,
    @JsonKey(name: 'available_seats') final int? availableSeats,
    @JsonKey(name: 'company_id') final int? companyId,
    final String? status,
    @JsonKey(name: 'total_enrolled') final int? totalEnrolled,
    @JsonKey(name: 'seats_percentage') final double? seatsPercentage,
    @JsonKey(name: 'company_name') final String? companyName,
    final String? location,
    @JsonKey(name: 'is_saved') final bool? isSaved,
    @JsonKey(name: 'start_date') final String? startDate,
    @JsonKey(name: 'start_time') final String? startTime,
    @JsonKey(name: 'created_at') final String? createdAt,
    @JsonKey(name: 'formatted_price') final String? formattedPrice,
    @JsonKey(name: 'formatted_created_at') final String? formattedCreatedAt,
    final String? type,
    final List<String>? highlights,
  }) = _$CourseImpl;

  factory _Course.fromJson(Map<String, dynamic> json) = _$CourseImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get description;
  @override
  @JsonKey(name: 'featured_image')
  String? get featuredImage;
  @override
  @JsonKey(name: 'course_category')
  String? get courseCategory;
  @override
  String? get price;
  @override
  @JsonKey(name: 'is_free')
  int? get isFree;
  @override
  String? get level;
  @override
  @JsonKey(name: 'has_certificate')
  @HasCertificateConverter()
  bool? get hasCertificate;
  @override
  @JsonKey(name: 'available_seats')
  int? get availableSeats;
  @override
  @JsonKey(name: 'company_id')
  int? get companyId;
  @override
  String? get status;
  @override
  @JsonKey(name: 'total_enrolled')
  int? get totalEnrolled;
  @override
  @JsonKey(name: 'seats_percentage')
  double? get seatsPercentage;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  String? get location;
  @override
  @JsonKey(name: 'is_saved')
  bool? get isSaved;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'start_time')
  String? get startTime;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  @JsonKey(name: 'formatted_price')
  String? get formattedPrice;
  @override
  @JsonKey(name: 'formatted_created_at')
  String? get formattedCreatedAt;
  @override
  String? get type;
  @override
  List<String>? get highlights;

  /// Create a copy of Course
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CourseImplCopyWith<_$CourseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
