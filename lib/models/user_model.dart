import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class User with _$User {
  const factory User({
    required int id,
    required String phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'first_name') String? firstName,
    @JsonKey(name: 'last_name') String? lastName,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'city') String? city,
    @JsonKey(name: 'disability_id') int? disabilityId,
    @JsonKey(name: 'is_verified') bool? isVerified,
    @JsonKey(name: 'is_completed') bool? isCompleted,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String status,
    required String message,
    @JsonKey(name: 'status_code') required String statusCode,
    AuthData? data,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
}

@freezed
class AuthData with _$AuthData {
  const factory AuthData({
    @JsonKey(name: 'user_id') int? userId,
    String? token,
    User? user,
    @JsonKey(name: 'next_step') String? nextStep,
  }) = _AuthData;

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);
}

