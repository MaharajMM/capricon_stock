import 'dart:convert';

class ErrorModel {
  final dynamic data;
  final ErrorResponse? error;

  ErrorModel({
    this.data,
    this.error,
  });

  ErrorModel copyWith({
    dynamic data,
    ErrorResponse? error,
  }) =>
      ErrorModel(
        data: data ?? this.data,
        error: error ?? this.error,
      );

  factory ErrorModel.fromJson(String str) => ErrorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorModel.fromMap(Map<String, dynamic> json) => ErrorModel(
        data: json["data"],
        error: json["error"] == null ? null : ErrorResponse.fromMap(json["error"]),
      );

  Map<String, dynamic> toMap() => {
        "data": data,
        "error": error?.toMap(),
      };
}

class ErrorResponse {
  final int? status;
  final String? name;
  final String? message;
  final dynamic details;

  ErrorResponse({
    this.status,
    this.name,
    this.message,
    this.details,
  });

  ErrorResponse copyWith({
    int? status,
    String? name,
    String? message,
    dynamic details,
  }) =>
      ErrorResponse(
        status: status ?? this.status,
        name: name ?? this.name,
        message: message ?? this.message,
        details: details ?? this.details,
      );

  factory ErrorResponse.fromJson(String str) => ErrorResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ErrorResponse.fromMap(Map<String, dynamic> json) => ErrorResponse(
        status: json["status"],
        name: json["name"],
        message: json["message"],
        details: json["details"],
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "name": name,
        "message": message,
        "details": details,
      };
}
