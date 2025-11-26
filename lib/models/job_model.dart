import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_model.freezed.dart';
part 'job_model.g.dart';

@freezed
class Job with _$Job {
  const factory Job({
    required int id,
    @JsonKey(name: 'company_id') required int companyId,
    @JsonKey(name: 'job_title') required String jobTitle,
    @JsonKey(name: 'job_description') required String jobDescription,
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
  }) = _Job;

  factory Job.fromJson(Map<String, dynamic> json) => _$JobFromJson(json);
}

@freezed
class Company with _$Company {
  const factory Company({
    required int id,
    required String name,
    String? logo,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}

