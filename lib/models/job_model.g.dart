// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JobImpl _$$JobImplFromJson(Map<String, dynamic> json) => _$JobImpl(
  id: (json['id'] as num).toInt(),
  companyId: (json['company_id'] as num).toInt(),
  jobTitle: json['job_title'] as String,
  jobDescription: json['job_description'] as String,
  minSalary: (json['min_salary'] as num?)?.toInt(),
  maxSalary: (json['max_salary'] as num?)?.toInt(),
  salaryToBeDiscussed: json['salary_to_be_discussed'] as bool?,
  experienceLevel: json['experience_level'] as String?,
  education: json['education'] as String?,
  jobType: json['job_type'] as String?,
  locationPriority: json['location_priority'] as String?,
  officeLocation: json['office_location'] as String?,
  isMultipleHires: json['is_multiple_hires'] as bool?,
  isUrgent: json['is_urgent'] as bool?,
  isSaved: json['is_saved'] as bool?,
  isFeatured: json['is_featured'] as bool?,
  status: json['status'] as String?,
  createdAt: json['created_at'] as String?,
  responsibilities: json['responsibilities'] as String?,
  requirements: json['requirements'] as String?,
  qualifications: json['qualifications'] as String?,
  benefits: json['benefits'] as String?,
  yearsOfExperience: (json['years_of_experience'] as num?)?.toInt(),
  cityId: (json['city_id'] as num?)?.toInt(),
  hasApplied: json['has_applied'] as bool?,
  companyName: json['company_name'] as String?,
  companyLogo: json['company_logo'] as String?,
  formattedSalary: json['formatted_salary'] as String?,
  activeSince: json['active_since'] as String?,
  disabilityOther: json['disability_other'] as String?,
  company: json['company'] == null
      ? null
      : Company.fromJson(json['company'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$JobImplToJson(_$JobImpl instance) => <String, dynamic>{
  'id': instance.id,
  'company_id': instance.companyId,
  'job_title': instance.jobTitle,
  'job_description': instance.jobDescription,
  'min_salary': instance.minSalary,
  'max_salary': instance.maxSalary,
  'salary_to_be_discussed': instance.salaryToBeDiscussed,
  'experience_level': instance.experienceLevel,
  'education': instance.education,
  'job_type': instance.jobType,
  'location_priority': instance.locationPriority,
  'office_location': instance.officeLocation,
  'is_multiple_hires': instance.isMultipleHires,
  'is_urgent': instance.isUrgent,
  'is_saved': instance.isSaved,
  'is_featured': instance.isFeatured,
  'status': instance.status,
  'created_at': instance.createdAt,
  'responsibilities': instance.responsibilities,
  'requirements': instance.requirements,
  'qualifications': instance.qualifications,
  'benefits': instance.benefits,
  'years_of_experience': instance.yearsOfExperience,
  'city_id': instance.cityId,
  'has_applied': instance.hasApplied,
  'company_name': instance.companyName,
  'company_logo': instance.companyLogo,
  'formatted_salary': instance.formattedSalary,
  'active_since': instance.activeSince,
  'disability_other': instance.disabilityOther,
  'company': instance.company,
};

_$CompanyImpl _$$CompanyImplFromJson(Map<String, dynamic> json) =>
    _$CompanyImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      logo: json['logo'] as String?,
    );

Map<String, dynamic> _$$CompanyImplToJson(_$CompanyImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo': instance.logo,
    };
