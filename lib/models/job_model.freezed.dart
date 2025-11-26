// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Job _$JobFromJson(Map<String, dynamic> json) {
  return _Job.fromJson(json);
}

/// @nodoc
mixin _$Job {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_id')
  int get companyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_title')
  String get jobTitle => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_description')
  String get jobDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_salary')
  int? get minSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_salary')
  int? get maxSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'salary_to_be_discussed')
  bool? get salaryToBeDiscussed => throw _privateConstructorUsedError;
  @JsonKey(name: 'experience_level')
  String? get experienceLevel => throw _privateConstructorUsedError;
  String? get education => throw _privateConstructorUsedError;
  @JsonKey(name: 'job_type')
  String? get jobType => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_priority')
  String? get locationPriority => throw _privateConstructorUsedError;
  @JsonKey(name: 'office_location')
  String? get officeLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_multiple_hires')
  bool? get isMultipleHires => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_urgent')
  bool? get isUrgent => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_saved')
  bool? get isSaved => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_featured')
  bool? get isFeatured => throw _privateConstructorUsedError;
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  String? get createdAt => throw _privateConstructorUsedError;
  String? get responsibilities => throw _privateConstructorUsedError;
  String? get requirements => throw _privateConstructorUsedError;
  String? get qualifications => throw _privateConstructorUsedError;
  String? get benefits => throw _privateConstructorUsedError;
  @JsonKey(name: 'years_of_experience')
  int? get yearsOfExperience => throw _privateConstructorUsedError;
  @JsonKey(name: 'city_id')
  int? get cityId => throw _privateConstructorUsedError;
  @JsonKey(name: 'has_applied')
  bool? get hasApplied => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_name')
  String? get companyName => throw _privateConstructorUsedError;
  @JsonKey(name: 'company_logo')
  String? get companyLogo => throw _privateConstructorUsedError;
  @JsonKey(name: 'formatted_salary')
  String? get formattedSalary => throw _privateConstructorUsedError;
  @JsonKey(name: 'active_since')
  String? get activeSince => throw _privateConstructorUsedError;
  @JsonKey(name: 'disability_other')
  String? get disabilityOther => throw _privateConstructorUsedError;
  Company? get company => throw _privateConstructorUsedError;

  /// Serializes this Job to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $JobCopyWith<Job> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobCopyWith<$Res> {
  factory $JobCopyWith(Job value, $Res Function(Job) then) =
      _$JobCopyWithImpl<$Res, Job>;
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'company_id') int companyId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'job_description') String jobDescription,
    @JsonKey(name: 'min_salary') int? minSalary,
    @JsonKey(name: 'max_salary') int? maxSalary,
    @JsonKey(name: 'salary_to_be_discussed') bool? salaryToBeDiscussed,
    @JsonKey(name: 'experience_level') String? experienceLevel,
    String? education,
    @JsonKey(name: 'job_type') String? jobType,
    @JsonKey(name: 'location_priority') String? locationPriority,
    @JsonKey(name: 'office_location') String? officeLocation,
    @JsonKey(name: 'is_multiple_hires') bool? isMultipleHires,
    @JsonKey(name: 'is_urgent') bool? isUrgent,
    @JsonKey(name: 'is_saved') bool? isSaved,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    String? responsibilities,
    String? requirements,
    String? qualifications,
    String? benefits,
    @JsonKey(name: 'years_of_experience') int? yearsOfExperience,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'has_applied') bool? hasApplied,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_logo') String? companyLogo,
    @JsonKey(name: 'formatted_salary') String? formattedSalary,
    @JsonKey(name: 'active_since') String? activeSince,
    @JsonKey(name: 'disability_other') String? disabilityOther,
    Company? company,
  });

  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class _$JobCopyWithImpl<$Res, $Val extends Job> implements $JobCopyWith<$Res> {
  _$JobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? jobTitle = null,
    Object? jobDescription = null,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? salaryToBeDiscussed = freezed,
    Object? experienceLevel = freezed,
    Object? education = freezed,
    Object? jobType = freezed,
    Object? locationPriority = freezed,
    Object? officeLocation = freezed,
    Object? isMultipleHires = freezed,
    Object? isUrgent = freezed,
    Object? isSaved = freezed,
    Object? isFeatured = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? responsibilities = freezed,
    Object? requirements = freezed,
    Object? qualifications = freezed,
    Object? benefits = freezed,
    Object? yearsOfExperience = freezed,
    Object? cityId = freezed,
    Object? hasApplied = freezed,
    Object? companyName = freezed,
    Object? companyLogo = freezed,
    Object? formattedSalary = freezed,
    Object? activeSince = freezed,
    Object? disabilityOther = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            companyId: null == companyId
                ? _value.companyId
                : companyId // ignore: cast_nullable_to_non_nullable
                      as int,
            jobTitle: null == jobTitle
                ? _value.jobTitle
                : jobTitle // ignore: cast_nullable_to_non_nullable
                      as String,
            jobDescription: null == jobDescription
                ? _value.jobDescription
                : jobDescription // ignore: cast_nullable_to_non_nullable
                      as String,
            minSalary: freezed == minSalary
                ? _value.minSalary
                : minSalary // ignore: cast_nullable_to_non_nullable
                      as int?,
            maxSalary: freezed == maxSalary
                ? _value.maxSalary
                : maxSalary // ignore: cast_nullable_to_non_nullable
                      as int?,
            salaryToBeDiscussed: freezed == salaryToBeDiscussed
                ? _value.salaryToBeDiscussed
                : salaryToBeDiscussed // ignore: cast_nullable_to_non_nullable
                      as bool?,
            experienceLevel: freezed == experienceLevel
                ? _value.experienceLevel
                : experienceLevel // ignore: cast_nullable_to_non_nullable
                      as String?,
            education: freezed == education
                ? _value.education
                : education // ignore: cast_nullable_to_non_nullable
                      as String?,
            jobType: freezed == jobType
                ? _value.jobType
                : jobType // ignore: cast_nullable_to_non_nullable
                      as String?,
            locationPriority: freezed == locationPriority
                ? _value.locationPriority
                : locationPriority // ignore: cast_nullable_to_non_nullable
                      as String?,
            officeLocation: freezed == officeLocation
                ? _value.officeLocation
                : officeLocation // ignore: cast_nullable_to_non_nullable
                      as String?,
            isMultipleHires: freezed == isMultipleHires
                ? _value.isMultipleHires
                : isMultipleHires // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isUrgent: freezed == isUrgent
                ? _value.isUrgent
                : isUrgent // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isSaved: freezed == isSaved
                ? _value.isSaved
                : isSaved // ignore: cast_nullable_to_non_nullable
                      as bool?,
            isFeatured: freezed == isFeatured
                ? _value.isFeatured
                : isFeatured // ignore: cast_nullable_to_non_nullable
                      as bool?,
            status: freezed == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                      as String?,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as String?,
            responsibilities: freezed == responsibilities
                ? _value.responsibilities
                : responsibilities // ignore: cast_nullable_to_non_nullable
                      as String?,
            requirements: freezed == requirements
                ? _value.requirements
                : requirements // ignore: cast_nullable_to_non_nullable
                      as String?,
            qualifications: freezed == qualifications
                ? _value.qualifications
                : qualifications // ignore: cast_nullable_to_non_nullable
                      as String?,
            benefits: freezed == benefits
                ? _value.benefits
                : benefits // ignore: cast_nullable_to_non_nullable
                      as String?,
            yearsOfExperience: freezed == yearsOfExperience
                ? _value.yearsOfExperience
                : yearsOfExperience // ignore: cast_nullable_to_non_nullable
                      as int?,
            cityId: freezed == cityId
                ? _value.cityId
                : cityId // ignore: cast_nullable_to_non_nullable
                      as int?,
            hasApplied: freezed == hasApplied
                ? _value.hasApplied
                : hasApplied // ignore: cast_nullable_to_non_nullable
                      as bool?,
            companyName: freezed == companyName
                ? _value.companyName
                : companyName // ignore: cast_nullable_to_non_nullable
                      as String?,
            companyLogo: freezed == companyLogo
                ? _value.companyLogo
                : companyLogo // ignore: cast_nullable_to_non_nullable
                      as String?,
            formattedSalary: freezed == formattedSalary
                ? _value.formattedSalary
                : formattedSalary // ignore: cast_nullable_to_non_nullable
                      as String?,
            activeSince: freezed == activeSince
                ? _value.activeSince
                : activeSince // ignore: cast_nullable_to_non_nullable
                      as String?,
            disabilityOther: freezed == disabilityOther
                ? _value.disabilityOther
                : disabilityOther // ignore: cast_nullable_to_non_nullable
                      as String?,
            company: freezed == company
                ? _value.company
                : company // ignore: cast_nullable_to_non_nullable
                      as Company?,
          )
          as $Val,
    );
  }

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CompanyCopyWith<$Res>? get company {
    if (_value.company == null) {
      return null;
    }

    return $CompanyCopyWith<$Res>(_value.company!, (value) {
      return _then(_value.copyWith(company: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$JobImplCopyWith<$Res> implements $JobCopyWith<$Res> {
  factory _$$JobImplCopyWith(_$JobImpl value, $Res Function(_$JobImpl) then) =
      __$$JobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    @JsonKey(name: 'company_id') int companyId,
    @JsonKey(name: 'job_title') String jobTitle,
    @JsonKey(name: 'job_description') String jobDescription,
    @JsonKey(name: 'min_salary') int? minSalary,
    @JsonKey(name: 'max_salary') int? maxSalary,
    @JsonKey(name: 'salary_to_be_discussed') bool? salaryToBeDiscussed,
    @JsonKey(name: 'experience_level') String? experienceLevel,
    String? education,
    @JsonKey(name: 'job_type') String? jobType,
    @JsonKey(name: 'location_priority') String? locationPriority,
    @JsonKey(name: 'office_location') String? officeLocation,
    @JsonKey(name: 'is_multiple_hires') bool? isMultipleHires,
    @JsonKey(name: 'is_urgent') bool? isUrgent,
    @JsonKey(name: 'is_saved') bool? isSaved,
    @JsonKey(name: 'is_featured') bool? isFeatured,
    String? status,
    @JsonKey(name: 'created_at') String? createdAt,
    String? responsibilities,
    String? requirements,
    String? qualifications,
    String? benefits,
    @JsonKey(name: 'years_of_experience') int? yearsOfExperience,
    @JsonKey(name: 'city_id') int? cityId,
    @JsonKey(name: 'has_applied') bool? hasApplied,
    @JsonKey(name: 'company_name') String? companyName,
    @JsonKey(name: 'company_logo') String? companyLogo,
    @JsonKey(name: 'formatted_salary') String? formattedSalary,
    @JsonKey(name: 'active_since') String? activeSince,
    @JsonKey(name: 'disability_other') String? disabilityOther,
    Company? company,
  });

  @override
  $CompanyCopyWith<$Res>? get company;
}

/// @nodoc
class __$$JobImplCopyWithImpl<$Res> extends _$JobCopyWithImpl<$Res, _$JobImpl>
    implements _$$JobImplCopyWith<$Res> {
  __$$JobImplCopyWithImpl(_$JobImpl _value, $Res Function(_$JobImpl) _then)
    : super(_value, _then);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? companyId = null,
    Object? jobTitle = null,
    Object? jobDescription = null,
    Object? minSalary = freezed,
    Object? maxSalary = freezed,
    Object? salaryToBeDiscussed = freezed,
    Object? experienceLevel = freezed,
    Object? education = freezed,
    Object? jobType = freezed,
    Object? locationPriority = freezed,
    Object? officeLocation = freezed,
    Object? isMultipleHires = freezed,
    Object? isUrgent = freezed,
    Object? isSaved = freezed,
    Object? isFeatured = freezed,
    Object? status = freezed,
    Object? createdAt = freezed,
    Object? responsibilities = freezed,
    Object? requirements = freezed,
    Object? qualifications = freezed,
    Object? benefits = freezed,
    Object? yearsOfExperience = freezed,
    Object? cityId = freezed,
    Object? hasApplied = freezed,
    Object? companyName = freezed,
    Object? companyLogo = freezed,
    Object? formattedSalary = freezed,
    Object? activeSince = freezed,
    Object? disabilityOther = freezed,
    Object? company = freezed,
  }) {
    return _then(
      _$JobImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        companyId: null == companyId
            ? _value.companyId
            : companyId // ignore: cast_nullable_to_non_nullable
                  as int,
        jobTitle: null == jobTitle
            ? _value.jobTitle
            : jobTitle // ignore: cast_nullable_to_non_nullable
                  as String,
        jobDescription: null == jobDescription
            ? _value.jobDescription
            : jobDescription // ignore: cast_nullable_to_non_nullable
                  as String,
        minSalary: freezed == minSalary
            ? _value.minSalary
            : minSalary // ignore: cast_nullable_to_non_nullable
                  as int?,
        maxSalary: freezed == maxSalary
            ? _value.maxSalary
            : maxSalary // ignore: cast_nullable_to_non_nullable
                  as int?,
        salaryToBeDiscussed: freezed == salaryToBeDiscussed
            ? _value.salaryToBeDiscussed
            : salaryToBeDiscussed // ignore: cast_nullable_to_non_nullable
                  as bool?,
        experienceLevel: freezed == experienceLevel
            ? _value.experienceLevel
            : experienceLevel // ignore: cast_nullable_to_non_nullable
                  as String?,
        education: freezed == education
            ? _value.education
            : education // ignore: cast_nullable_to_non_nullable
                  as String?,
        jobType: freezed == jobType
            ? _value.jobType
            : jobType // ignore: cast_nullable_to_non_nullable
                  as String?,
        locationPriority: freezed == locationPriority
            ? _value.locationPriority
            : locationPriority // ignore: cast_nullable_to_non_nullable
                  as String?,
        officeLocation: freezed == officeLocation
            ? _value.officeLocation
            : officeLocation // ignore: cast_nullable_to_non_nullable
                  as String?,
        isMultipleHires: freezed == isMultipleHires
            ? _value.isMultipleHires
            : isMultipleHires // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isUrgent: freezed == isUrgent
            ? _value.isUrgent
            : isUrgent // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isSaved: freezed == isSaved
            ? _value.isSaved
            : isSaved // ignore: cast_nullable_to_non_nullable
                  as bool?,
        isFeatured: freezed == isFeatured
            ? _value.isFeatured
            : isFeatured // ignore: cast_nullable_to_non_nullable
                  as bool?,
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String?,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as String?,
        responsibilities: freezed == responsibilities
            ? _value.responsibilities
            : responsibilities // ignore: cast_nullable_to_non_nullable
                  as String?,
        requirements: freezed == requirements
            ? _value.requirements
            : requirements // ignore: cast_nullable_to_non_nullable
                  as String?,
        qualifications: freezed == qualifications
            ? _value.qualifications
            : qualifications // ignore: cast_nullable_to_non_nullable
                  as String?,
        benefits: freezed == benefits
            ? _value.benefits
            : benefits // ignore: cast_nullable_to_non_nullable
                  as String?,
        yearsOfExperience: freezed == yearsOfExperience
            ? _value.yearsOfExperience
            : yearsOfExperience // ignore: cast_nullable_to_non_nullable
                  as int?,
        cityId: freezed == cityId
            ? _value.cityId
            : cityId // ignore: cast_nullable_to_non_nullable
                  as int?,
        hasApplied: freezed == hasApplied
            ? _value.hasApplied
            : hasApplied // ignore: cast_nullable_to_non_nullable
                  as bool?,
        companyName: freezed == companyName
            ? _value.companyName
            : companyName // ignore: cast_nullable_to_non_nullable
                  as String?,
        companyLogo: freezed == companyLogo
            ? _value.companyLogo
            : companyLogo // ignore: cast_nullable_to_non_nullable
                  as String?,
        formattedSalary: freezed == formattedSalary
            ? _value.formattedSalary
            : formattedSalary // ignore: cast_nullable_to_non_nullable
                  as String?,
        activeSince: freezed == activeSince
            ? _value.activeSince
            : activeSince // ignore: cast_nullable_to_non_nullable
                  as String?,
        disabilityOther: freezed == disabilityOther
            ? _value.disabilityOther
            : disabilityOther // ignore: cast_nullable_to_non_nullable
                  as String?,
        company: freezed == company
            ? _value.company
            : company // ignore: cast_nullable_to_non_nullable
                  as Company?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$JobImpl implements _Job {
  const _$JobImpl({
    required this.id,
    @JsonKey(name: 'company_id') required this.companyId,
    @JsonKey(name: 'job_title') required this.jobTitle,
    @JsonKey(name: 'job_description') required this.jobDescription,
    @JsonKey(name: 'min_salary') this.minSalary,
    @JsonKey(name: 'max_salary') this.maxSalary,
    @JsonKey(name: 'salary_to_be_discussed') this.salaryToBeDiscussed,
    @JsonKey(name: 'experience_level') this.experienceLevel,
    this.education,
    @JsonKey(name: 'job_type') this.jobType,
    @JsonKey(name: 'location_priority') this.locationPriority,
    @JsonKey(name: 'office_location') this.officeLocation,
    @JsonKey(name: 'is_multiple_hires') this.isMultipleHires,
    @JsonKey(name: 'is_urgent') this.isUrgent,
    @JsonKey(name: 'is_saved') this.isSaved,
    @JsonKey(name: 'is_featured') this.isFeatured,
    this.status,
    @JsonKey(name: 'created_at') this.createdAt,
    this.responsibilities,
    this.requirements,
    this.qualifications,
    this.benefits,
    @JsonKey(name: 'years_of_experience') this.yearsOfExperience,
    @JsonKey(name: 'city_id') this.cityId,
    @JsonKey(name: 'has_applied') this.hasApplied,
    @JsonKey(name: 'company_name') this.companyName,
    @JsonKey(name: 'company_logo') this.companyLogo,
    @JsonKey(name: 'formatted_salary') this.formattedSalary,
    @JsonKey(name: 'active_since') this.activeSince,
    @JsonKey(name: 'disability_other') this.disabilityOther,
    this.company,
  });

  factory _$JobImpl.fromJson(Map<String, dynamic> json) =>
      _$$JobImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'company_id')
  final int companyId;
  @override
  @JsonKey(name: 'job_title')
  final String jobTitle;
  @override
  @JsonKey(name: 'job_description')
  final String jobDescription;
  @override
  @JsonKey(name: 'min_salary')
  final int? minSalary;
  @override
  @JsonKey(name: 'max_salary')
  final int? maxSalary;
  @override
  @JsonKey(name: 'salary_to_be_discussed')
  final bool? salaryToBeDiscussed;
  @override
  @JsonKey(name: 'experience_level')
  final String? experienceLevel;
  @override
  final String? education;
  @override
  @JsonKey(name: 'job_type')
  final String? jobType;
  @override
  @JsonKey(name: 'location_priority')
  final String? locationPriority;
  @override
  @JsonKey(name: 'office_location')
  final String? officeLocation;
  @override
  @JsonKey(name: 'is_multiple_hires')
  final bool? isMultipleHires;
  @override
  @JsonKey(name: 'is_urgent')
  final bool? isUrgent;
  @override
  @JsonKey(name: 'is_saved')
  final bool? isSaved;
  @override
  @JsonKey(name: 'is_featured')
  final bool? isFeatured;
  @override
  final String? status;
  @override
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @override
  final String? responsibilities;
  @override
  final String? requirements;
  @override
  final String? qualifications;
  @override
  final String? benefits;
  @override
  @JsonKey(name: 'years_of_experience')
  final int? yearsOfExperience;
  @override
  @JsonKey(name: 'city_id')
  final int? cityId;
  @override
  @JsonKey(name: 'has_applied')
  final bool? hasApplied;
  @override
  @JsonKey(name: 'company_name')
  final String? companyName;
  @override
  @JsonKey(name: 'company_logo')
  final String? companyLogo;
  @override
  @JsonKey(name: 'formatted_salary')
  final String? formattedSalary;
  @override
  @JsonKey(name: 'active_since')
  final String? activeSince;
  @override
  @JsonKey(name: 'disability_other')
  final String? disabilityOther;
  @override
  final Company? company;

  @override
  String toString() {
    return 'Job(id: $id, companyId: $companyId, jobTitle: $jobTitle, jobDescription: $jobDescription, minSalary: $minSalary, maxSalary: $maxSalary, salaryToBeDiscussed: $salaryToBeDiscussed, experienceLevel: $experienceLevel, education: $education, jobType: $jobType, locationPriority: $locationPriority, officeLocation: $officeLocation, isMultipleHires: $isMultipleHires, isUrgent: $isUrgent, isSaved: $isSaved, isFeatured: $isFeatured, status: $status, createdAt: $createdAt, responsibilities: $responsibilities, requirements: $requirements, qualifications: $qualifications, benefits: $benefits, yearsOfExperience: $yearsOfExperience, cityId: $cityId, hasApplied: $hasApplied, companyName: $companyName, companyLogo: $companyLogo, formattedSalary: $formattedSalary, activeSince: $activeSince, disabilityOther: $disabilityOther, company: $company)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.companyId, companyId) ||
                other.companyId == companyId) &&
            (identical(other.jobTitle, jobTitle) ||
                other.jobTitle == jobTitle) &&
            (identical(other.jobDescription, jobDescription) ||
                other.jobDescription == jobDescription) &&
            (identical(other.minSalary, minSalary) ||
                other.minSalary == minSalary) &&
            (identical(other.maxSalary, maxSalary) ||
                other.maxSalary == maxSalary) &&
            (identical(other.salaryToBeDiscussed, salaryToBeDiscussed) ||
                other.salaryToBeDiscussed == salaryToBeDiscussed) &&
            (identical(other.experienceLevel, experienceLevel) ||
                other.experienceLevel == experienceLevel) &&
            (identical(other.education, education) ||
                other.education == education) &&
            (identical(other.jobType, jobType) || other.jobType == jobType) &&
            (identical(other.locationPriority, locationPriority) ||
                other.locationPriority == locationPriority) &&
            (identical(other.officeLocation, officeLocation) ||
                other.officeLocation == officeLocation) &&
            (identical(other.isMultipleHires, isMultipleHires) ||
                other.isMultipleHires == isMultipleHires) &&
            (identical(other.isUrgent, isUrgent) ||
                other.isUrgent == isUrgent) &&
            (identical(other.isSaved, isSaved) || other.isSaved == isSaved) &&
            (identical(other.isFeatured, isFeatured) ||
                other.isFeatured == isFeatured) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.responsibilities, responsibilities) ||
                other.responsibilities == responsibilities) &&
            (identical(other.requirements, requirements) ||
                other.requirements == requirements) &&
            (identical(other.qualifications, qualifications) ||
                other.qualifications == qualifications) &&
            (identical(other.benefits, benefits) ||
                other.benefits == benefits) &&
            (identical(other.yearsOfExperience, yearsOfExperience) ||
                other.yearsOfExperience == yearsOfExperience) &&
            (identical(other.cityId, cityId) || other.cityId == cityId) &&
            (identical(other.hasApplied, hasApplied) ||
                other.hasApplied == hasApplied) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.companyLogo, companyLogo) ||
                other.companyLogo == companyLogo) &&
            (identical(other.formattedSalary, formattedSalary) ||
                other.formattedSalary == formattedSalary) &&
            (identical(other.activeSince, activeSince) ||
                other.activeSince == activeSince) &&
            (identical(other.disabilityOther, disabilityOther) ||
                other.disabilityOther == disabilityOther) &&
            (identical(other.company, company) || other.company == company));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    id,
    companyId,
    jobTitle,
    jobDescription,
    minSalary,
    maxSalary,
    salaryToBeDiscussed,
    experienceLevel,
    education,
    jobType,
    locationPriority,
    officeLocation,
    isMultipleHires,
    isUrgent,
    isSaved,
    isFeatured,
    status,
    createdAt,
    responsibilities,
    requirements,
    qualifications,
    benefits,
    yearsOfExperience,
    cityId,
    hasApplied,
    companyName,
    companyLogo,
    formattedSalary,
    activeSince,
    disabilityOther,
    company,
  ]);

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      __$$JobImplCopyWithImpl<_$JobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$JobImplToJson(this);
  }
}

abstract class _Job implements Job {
  const factory _Job({
    required final int id,
    @JsonKey(name: 'company_id') required final int companyId,
    @JsonKey(name: 'job_title') required final String jobTitle,
    @JsonKey(name: 'job_description') required final String jobDescription,
    @JsonKey(name: 'min_salary') final int? minSalary,
    @JsonKey(name: 'max_salary') final int? maxSalary,
    @JsonKey(name: 'salary_to_be_discussed') final bool? salaryToBeDiscussed,
    @JsonKey(name: 'experience_level') final String? experienceLevel,
    final String? education,
    @JsonKey(name: 'job_type') final String? jobType,
    @JsonKey(name: 'location_priority') final String? locationPriority,
    @JsonKey(name: 'office_location') final String? officeLocation,
    @JsonKey(name: 'is_multiple_hires') final bool? isMultipleHires,
    @JsonKey(name: 'is_urgent') final bool? isUrgent,
    @JsonKey(name: 'is_saved') final bool? isSaved,
    @JsonKey(name: 'is_featured') final bool? isFeatured,
    final String? status,
    @JsonKey(name: 'created_at') final String? createdAt,
    final String? responsibilities,
    final String? requirements,
    final String? qualifications,
    final String? benefits,
    @JsonKey(name: 'years_of_experience') final int? yearsOfExperience,
    @JsonKey(name: 'city_id') final int? cityId,
    @JsonKey(name: 'has_applied') final bool? hasApplied,
    @JsonKey(name: 'company_name') final String? companyName,
    @JsonKey(name: 'company_logo') final String? companyLogo,
    @JsonKey(name: 'formatted_salary') final String? formattedSalary,
    @JsonKey(name: 'active_since') final String? activeSince,
    @JsonKey(name: 'disability_other') final String? disabilityOther,
    final Company? company,
  }) = _$JobImpl;

  factory _Job.fromJson(Map<String, dynamic> json) = _$JobImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'company_id')
  int get companyId;
  @override
  @JsonKey(name: 'job_title')
  String get jobTitle;
  @override
  @JsonKey(name: 'job_description')
  String get jobDescription;
  @override
  @JsonKey(name: 'min_salary')
  int? get minSalary;
  @override
  @JsonKey(name: 'max_salary')
  int? get maxSalary;
  @override
  @JsonKey(name: 'salary_to_be_discussed')
  bool? get salaryToBeDiscussed;
  @override
  @JsonKey(name: 'experience_level')
  String? get experienceLevel;
  @override
  String? get education;
  @override
  @JsonKey(name: 'job_type')
  String? get jobType;
  @override
  @JsonKey(name: 'location_priority')
  String? get locationPriority;
  @override
  @JsonKey(name: 'office_location')
  String? get officeLocation;
  @override
  @JsonKey(name: 'is_multiple_hires')
  bool? get isMultipleHires;
  @override
  @JsonKey(name: 'is_urgent')
  bool? get isUrgent;
  @override
  @JsonKey(name: 'is_saved')
  bool? get isSaved;
  @override
  @JsonKey(name: 'is_featured')
  bool? get isFeatured;
  @override
  String? get status;
  @override
  @JsonKey(name: 'created_at')
  String? get createdAt;
  @override
  String? get responsibilities;
  @override
  String? get requirements;
  @override
  String? get qualifications;
  @override
  String? get benefits;
  @override
  @JsonKey(name: 'years_of_experience')
  int? get yearsOfExperience;
  @override
  @JsonKey(name: 'city_id')
  int? get cityId;
  @override
  @JsonKey(name: 'has_applied')
  bool? get hasApplied;
  @override
  @JsonKey(name: 'company_name')
  String? get companyName;
  @override
  @JsonKey(name: 'company_logo')
  String? get companyLogo;
  @override
  @JsonKey(name: 'formatted_salary')
  String? get formattedSalary;
  @override
  @JsonKey(name: 'active_since')
  String? get activeSince;
  @override
  @JsonKey(name: 'disability_other')
  String? get disabilityOther;
  @override
  Company? get company;

  /// Create a copy of Job
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$JobImplCopyWith<_$JobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Company _$CompanyFromJson(Map<String, dynamic> json) {
  return _Company.fromJson(json);
}

/// @nodoc
mixin _$Company {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get logo => throw _privateConstructorUsedError;

  /// Serializes this Company to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CompanyCopyWith<Company> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CompanyCopyWith<$Res> {
  factory $CompanyCopyWith(Company value, $Res Function(Company) then) =
      _$CompanyCopyWithImpl<$Res, Company>;
  @useResult
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class _$CompanyCopyWithImpl<$Res, $Val extends Company>
    implements $CompanyCopyWith<$Res> {
  _$CompanyCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? logo = freezed}) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            name: null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                      as String,
            logo: freezed == logo
                ? _value.logo
                : logo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$CompanyImplCopyWith<$Res> implements $CompanyCopyWith<$Res> {
  factory _$$CompanyImplCopyWith(
    _$CompanyImpl value,
    $Res Function(_$CompanyImpl) then,
  ) = __$$CompanyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String? logo});
}

/// @nodoc
class __$$CompanyImplCopyWithImpl<$Res>
    extends _$CompanyCopyWithImpl<$Res, _$CompanyImpl>
    implements _$$CompanyImplCopyWith<$Res> {
  __$$CompanyImplCopyWithImpl(
    _$CompanyImpl _value,
    $Res Function(_$CompanyImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? name = null, Object? logo = freezed}) {
    return _then(
      _$CompanyImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        name: null == name
            ? _value.name
            : name // ignore: cast_nullable_to_non_nullable
                  as String,
        logo: freezed == logo
            ? _value.logo
            : logo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$CompanyImpl implements _Company {
  const _$CompanyImpl({required this.id, required this.name, this.logo});

  factory _$CompanyImpl.fromJson(Map<String, dynamic> json) =>
      _$$CompanyImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String? logo;

  @override
  String toString() {
    return 'Company(id: $id, name: $name, logo: $logo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CompanyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, logo);

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      __$$CompanyImplCopyWithImpl<_$CompanyImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CompanyImplToJson(this);
  }
}

abstract class _Company implements Company {
  const factory _Company({
    required final int id,
    required final String name,
    final String? logo,
  }) = _$CompanyImpl;

  factory _Company.fromJson(Map<String, dynamic> json) = _$CompanyImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get logo;

  /// Create a copy of Company
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CompanyImplCopyWith<_$CompanyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
