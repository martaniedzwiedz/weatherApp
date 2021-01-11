import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable(nullable: false)
class ApiError {
  final String status;
  final String message;
  @JsonKey(nullable: true)
  final List<String> errors;

  ApiError({this.status, this.message, this.errors});

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
