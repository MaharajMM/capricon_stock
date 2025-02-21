import 'dart:convert';

class LoginModel {
  final String jwt;
  final User user;

  LoginModel({
    required this.jwt,
    required this.user,
  });

  LoginModel copyWith({
    String? jwt,
    User? user,
  }) =>
      LoginModel(
        jwt: jwt ?? this.jwt,
        user: user ?? this.user,
      );

  factory LoginModel.fromJson(String str) => LoginModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory LoginModel.fromMap(Map<String, dynamic> json) => LoginModel(
        jwt: json["jwt"],
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "jwt": jwt,
        "user": user.toMap(),
      };
}

class User {
  final int? id;
  final String? username;
  final String? email;
  final String? provider;
  final bool? confirmed;
  final bool? blocked;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? investorType;
  final dynamic fcmToken;
  final dynamic mobileNo;
  final dynamic city;
  final dynamic state;
  final dynamic zipCode;
  final dynamic resetPasswordOtp;
  final dynamic deletedAt;
  final dynamic externalProfilePictureUrl;
  final dynamic addressLine1;
  final dynamic addressLine2;
  final String? fullName;
  final dynamic ibkrOnboardingFinished;
  final dynamic guidedInvestingFinished;
  final dynamic customiseClimatePortfolio;

  User({
    this.id,
    this.username,
    this.email,
    this.provider,
    this.confirmed,
    this.blocked,
    this.createdAt,
    this.updatedAt,
    this.investorType,
    this.fcmToken,
    this.mobileNo,
    this.city,
    this.state,
    this.zipCode,
    this.resetPasswordOtp,
    this.deletedAt,
    this.externalProfilePictureUrl,
    this.addressLine1,
    this.addressLine2,
    this.fullName,
    this.ibkrOnboardingFinished,
    this.guidedInvestingFinished,
    this.customiseClimatePortfolio,
  });

  User copyWith({
    int? id,
    String? username,
    String? email,
    String? provider,
    bool? confirmed,
    bool? blocked,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? investorType,
    dynamic fcmToken,
    dynamic mobileNo,
    dynamic city,
    dynamic state,
    dynamic zipCode,
    dynamic resetPasswordOtp,
    dynamic deletedAt,
    dynamic externalProfilePictureUrl,
    dynamic addressLine1,
    dynamic addressLine2,
    String? fullName,
    dynamic ibkrOnboardingFinished,
    dynamic guidedInvestingFinished,
    dynamic customiseClimatePortfolio,
  }) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        provider: provider ?? this.provider,
        confirmed: confirmed ?? this.confirmed,
        blocked: blocked ?? this.blocked,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        investorType: investorType ?? this.investorType,
        fcmToken: fcmToken ?? this.fcmToken,
        mobileNo: mobileNo ?? this.mobileNo,
        city: city ?? this.city,
        state: state ?? this.state,
        zipCode: zipCode ?? this.zipCode,
        resetPasswordOtp: resetPasswordOtp ?? this.resetPasswordOtp,
        deletedAt: deletedAt ?? this.deletedAt,
        externalProfilePictureUrl: externalProfilePictureUrl ?? this.externalProfilePictureUrl,
        addressLine1: addressLine1 ?? this.addressLine1,
        addressLine2: addressLine2 ?? this.addressLine2,
        fullName: fullName ?? this.fullName,
        ibkrOnboardingFinished: ibkrOnboardingFinished ?? this.ibkrOnboardingFinished,
        guidedInvestingFinished: guidedInvestingFinished ?? this.guidedInvestingFinished,
        customiseClimatePortfolio: customiseClimatePortfolio ?? this.customiseClimatePortfolio,
      );

  factory User.fromJson(String str) => User.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory User.fromMap(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        investorType: json["investor_type"],
        fcmToken: json["fcm_token"],
        mobileNo: json["mobile_no"],
        city: json["city"],
        state: json["state"],
        zipCode: json["zip_code"],
        resetPasswordOtp: json["reset_password_otp"],
        deletedAt: json["deleted_at"],
        externalProfilePictureUrl: json["external_profile_picture_url"],
        addressLine1: json["address_line_1"],
        addressLine2: json["address_line_2"],
        fullName: json["full_name"],
        ibkrOnboardingFinished: json["ibkr_onboarding_finished"],
        guidedInvestingFinished: json["guided_investing_finished"],
        customiseClimatePortfolio: json["customise_climate_portfolio"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "investor_type": investorType,
        "fcm_token": fcmToken,
        "mobile_no": mobileNo,
        "city": city,
        "state": state,
        "zip_code": zipCode,
        "reset_password_otp": resetPasswordOtp,
        "deleted_at": deletedAt,
        "external_profile_picture_url": externalProfilePictureUrl,
        "address_line_1": addressLine1,
        "address_line_2": addressLine2,
        "full_name": fullName,
        "ibkr_onboarding_finished": ibkrOnboardingFinished,
        "guided_investing_finished": guidedInvestingFinished,
        "customise_climate_portfolio": customiseClimatePortfolio,
      };
}
