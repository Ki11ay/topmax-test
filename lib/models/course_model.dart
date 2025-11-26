import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

// Custom converter to handle both int and bool for has_certificate
class HasCertificateConverter implements JsonConverter<bool?, dynamic> {
  const HasCertificateConverter();

  @override
  bool? fromJson(dynamic value) {
    if (value == null) return null;
    if (value is bool) return value;
    if (value is int) return value == 1;
    if (value is String) return value == '1' || value.toLowerCase() == 'true';
    return null;
  }

  @override
  dynamic toJson(bool? value) {
    if (value == null) return null;
    return value ? 1 : 0;
  }
}

@freezed
class Course with _$Course {
  const factory Course({
    required int id,
    required String title,
    String? description,
    @JsonKey(name: 'featured_image') String? featuredImage,
    @JsonKey(name: 'course_category') String? courseCategory,
    String? price,
    @JsonKey(name: 'is_free') int? isFree,
    String? level,
    @JsonKey(name: 'has_certificate') @HasCertificateConverter() bool? hasCertificate,
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
  }) = _Course;

  factory Course.fromJson(Map<String, dynamic> json) => _$CourseFromJson(json);
}

