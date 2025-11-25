// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseImpl _$$CourseImplFromJson(Map<String, dynamic> json) => _$CourseImpl(
  id: (json['id'] as num).toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  featuredImage: json['featured_image'] as String?,
  courseCategory: json['course_category'] as String?,
  price: json['price'] as String?,
  isFree: (json['is_free'] as num?)?.toInt(),
  level: json['level'] as String?,
  hasCertificate: (json['has_certificate'] as num?)?.toInt(),
  availableSeats: (json['available_seats'] as num?)?.toInt(),
  companyId: (json['company_id'] as num?)?.toInt(),
  status: json['status'] as String?,
  totalEnrolled: (json['total_enrolled'] as num?)?.toInt(),
  seatsPercentage: (json['seats_percentage'] as num?)?.toDouble(),
  companyName: json['company_name'] as String?,
  location: json['location'] as String?,
  isSaved: json['is_saved'] as bool?,
  startDate: json['start_date'] as String?,
  startTime: json['start_time'] as String?,
  createdAt: json['created_at'] as String?,
  formattedPrice: json['formatted_price'] as String?,
  formattedCreatedAt: json['formatted_created_at'] as String?,
  type: json['type'] as String?,
  highlights: (json['highlights'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$$CourseImplToJson(_$CourseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'featured_image': instance.featuredImage,
      'course_category': instance.courseCategory,
      'price': instance.price,
      'is_free': instance.isFree,
      'level': instance.level,
      'has_certificate': instance.hasCertificate,
      'available_seats': instance.availableSeats,
      'company_id': instance.companyId,
      'status': instance.status,
      'total_enrolled': instance.totalEnrolled,
      'seats_percentage': instance.seatsPercentage,
      'company_name': instance.companyName,
      'location': instance.location,
      'is_saved': instance.isSaved,
      'start_date': instance.startDate,
      'start_time': instance.startTime,
      'created_at': instance.createdAt,
      'formatted_price': instance.formattedPrice,
      'formatted_created_at': instance.formattedCreatedAt,
      'type': instance.type,
      'highlights': instance.highlights,
    };
