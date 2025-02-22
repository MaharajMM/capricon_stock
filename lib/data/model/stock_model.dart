import 'dart:convert';

class StockModel {
  final int? id;
  final String? name;
  final String? symbol;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? alpacaId;
  final String? exchange;
  final String? description;
  final String? assetType;
  final String? isin;
  final String? industry;
  final String? sector;
  final int? employees;
  final String? website;
  final String? address;
  final String? netZeroProgress;
  final double? carbonIntensityScope3;
  final double? carbonIntensityScope1And2;
  final double? carbonIntensityScope1And2And3;
  final String? tempAlignmentScopes1And2;
  final bool? dnshAssessmentPass;
  final bool? goodGovernanceAssessment;
  final bool? contributeToEnvironmentOrSocialObjective;
  final bool? sustainableInvestment;
  final double? scope1Emissions;
  final double? scope2Emissions;
  final double? scope3Emissions;
  final double? totalEmissions;
  final String? listingDate;
  final String? marketCap;
  final int? ibkrConnectionId;
  final Image? image;
  final dynamic createdBy;
  final UpdatedBy? updatedBy;
  final double? price;
  final double? changePercent;
  final List<dynamic>? holdings;
  final List<dynamic>? sectorAllocation;
  final int? sustainableInvestmentHoldingPercentage;
  final bool? inPortfolio;

  StockModel({
    this.id,
    this.name,
    this.symbol,
    this.createdAt,
    this.updatedAt,
    this.alpacaId,
    this.exchange,
    this.description,
    this.assetType,
    this.isin,
    this.industry,
    this.sector,
    this.employees,
    this.website,
    this.address,
    this.netZeroProgress,
    this.carbonIntensityScope3,
    this.carbonIntensityScope1And2,
    this.carbonIntensityScope1And2And3,
    this.tempAlignmentScopes1And2,
    this.dnshAssessmentPass,
    this.goodGovernanceAssessment,
    this.contributeToEnvironmentOrSocialObjective,
    this.sustainableInvestment,
    this.scope1Emissions,
    this.scope2Emissions,
    this.scope3Emissions,
    this.totalEmissions,
    this.listingDate,
    this.marketCap,
    this.ibkrConnectionId,
    this.image,
    this.createdBy,
    this.updatedBy,
    this.price,
    this.changePercent,
    this.holdings,
    this.sectorAllocation,
    this.sustainableInvestmentHoldingPercentage,
    this.inPortfolio,
  });

  StockModel copyWith({
    int? id,
    String? name,
    String? symbol,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? alpacaId,
    String? exchange,
    String? description,
    String? assetType,
    String? isin,
    String? industry,
    String? sector,
    int? employees,
    String? website,
    String? address,
    String? netZeroProgress,
    double? carbonIntensityScope3,
    double? carbonIntensityScope1And2,
    double? carbonIntensityScope1And2And3,
    String? tempAlignmentScopes1And2,
    bool? dnshAssessmentPass,
    bool? goodGovernanceAssessment,
    bool? contributeToEnvironmentOrSocialObjective,
    bool? sustainableInvestment,
    double? scope1Emissions,
    double? scope2Emissions,
    double? scope3Emissions,
    double? totalEmissions,
    String? listingDate,
    String? marketCap,
    int? ibkrConnectionId,
    Image? image,
    dynamic createdBy,
    UpdatedBy? updatedBy,
    double? price,
    double? changePercent,
    List<dynamic>? holdings,
    List<dynamic>? sectorAllocation,
    int? sustainableInvestmentHoldingPercentage,
    bool? inPortfolio,
  }) =>
      StockModel(
        id: id ?? this.id,
        name: name ?? this.name,
        symbol: symbol ?? this.symbol,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        alpacaId: alpacaId ?? this.alpacaId,
        exchange: exchange ?? this.exchange,
        description: description ?? this.description,
        assetType: assetType ?? this.assetType,
        isin: isin ?? this.isin,
        industry: industry ?? this.industry,
        sector: sector ?? this.sector,
        employees: employees ?? this.employees,
        website: website ?? this.website,
        address: address ?? this.address,
        netZeroProgress: netZeroProgress ?? this.netZeroProgress,
        carbonIntensityScope3: carbonIntensityScope3 ?? this.carbonIntensityScope3,
        carbonIntensityScope1And2: carbonIntensityScope1And2 ?? this.carbonIntensityScope1And2,
        carbonIntensityScope1And2And3:
            carbonIntensityScope1And2And3 ?? this.carbonIntensityScope1And2And3,
        tempAlignmentScopes1And2: tempAlignmentScopes1And2 ?? this.tempAlignmentScopes1And2,
        dnshAssessmentPass: dnshAssessmentPass ?? this.dnshAssessmentPass,
        goodGovernanceAssessment: goodGovernanceAssessment ?? this.goodGovernanceAssessment,
        contributeToEnvironmentOrSocialObjective: contributeToEnvironmentOrSocialObjective ??
            this.contributeToEnvironmentOrSocialObjective,
        sustainableInvestment: sustainableInvestment ?? this.sustainableInvestment,
        scope1Emissions: scope1Emissions ?? this.scope1Emissions,
        scope2Emissions: scope2Emissions ?? this.scope2Emissions,
        scope3Emissions: scope3Emissions ?? this.scope3Emissions,
        totalEmissions: totalEmissions ?? this.totalEmissions,
        listingDate: listingDate ?? this.listingDate,
        marketCap: marketCap ?? this.marketCap,
        ibkrConnectionId: ibkrConnectionId ?? this.ibkrConnectionId,
        image: image ?? this.image,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        price: price ?? this.price,
        changePercent: changePercent ?? this.changePercent,
        holdings: holdings ?? this.holdings,
        sectorAllocation: sectorAllocation ?? this.sectorAllocation,
        sustainableInvestmentHoldingPercentage:
            sustainableInvestmentHoldingPercentage ?? this.sustainableInvestmentHoldingPercentage,
        inPortfolio: inPortfolio ?? this.inPortfolio,
      );

  factory StockModel.fromJson(String str) => StockModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StockModel.fromMap(Map<String, dynamic> json) => StockModel(
        id: json["id"],
        name: json["name"],
        symbol: json["symbol"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        alpacaId: json["alpaca_id"],
        exchange: json["exchange"],
        description: json["description"],
        assetType: json["asset_type"],
        isin: json["isin"],
        industry: json["industry"],
        sector: json["sector"],
        employees: json["employees"],
        website: json["website"],
        address: json["address"],
        netZeroProgress: json["net_zero_progress"],
        carbonIntensityScope3: json["carbon_intensity_scope_3"]?.toDouble(),
        carbonIntensityScope1And2: json["carbon_intensity_scope_1_and_2"]?.toDouble(),
        carbonIntensityScope1And2And3: json["carbon_intensity_scope_1_and_2_and_3"]?.toDouble(),
        tempAlignmentScopes1And2: json["temp_alignment_scopes_1_and_2"],
        dnshAssessmentPass: json["dnsh_assessment_pass"],
        goodGovernanceAssessment: json["good_governance_assessment"],
        contributeToEnvironmentOrSocialObjective:
            json["contribute_to_environment_or_social_objective"],
        sustainableInvestment: json["sustainable_investment"],
        scope1Emissions: json["scope_1_emissions"]?.toDouble(),
        scope2Emissions: json["scope_2_emissions"]?.toDouble(),
        scope3Emissions: json["scope_3_emissions"]?.toDouble(),
        totalEmissions: json["total_emissions"]?.toDouble(),
        listingDate: json["listing_date"],
        marketCap: json["market_cap"],
        ibkrConnectionId: json["ibkr_connection_id"],
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        createdBy: json["createdBy"],
        updatedBy: json["updatedBy"] == null ? null : UpdatedBy.fromMap(json["updatedBy"]),
        price: json["price"]?.toDouble(),
        changePercent: json["change_percent"]?.toDouble(),
        holdings:
            json["holdings"] == null ? [] : List<dynamic>.from(json["holdings"]!.map((x) => x)),
        sectorAllocation: json["sector_allocation"] == null
            ? []
            : List<dynamic>.from(json["sector_allocation"]!.map((x) => x)),
        sustainableInvestmentHoldingPercentage: json["sustainable_investment_holding_percentage"],
        inPortfolio: json["in_portfolio"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "symbol": symbol,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "alpaca_id": alpacaId,
        "exchange": exchange,
        "description": description,
        "asset_type": assetType,
        "isin": isin,
        "industry": industry,
        "sector": sector,
        "employees": employees,
        "website": website,
        "address": address,
        "net_zero_progress": netZeroProgress,
        "carbon_intensity_scope_3": carbonIntensityScope3,
        "carbon_intensity_scope_1_and_2": carbonIntensityScope1And2,
        "carbon_intensity_scope_1_and_2_and_3": carbonIntensityScope1And2And3,
        "temp_alignment_scopes_1_and_2": tempAlignmentScopes1And2,
        "dnsh_assessment_pass": dnshAssessmentPass,
        "good_governance_assessment": goodGovernanceAssessment,
        "contribute_to_environment_or_social_objective": contributeToEnvironmentOrSocialObjective,
        "sustainable_investment": sustainableInvestment,
        "scope_1_emissions": scope1Emissions,
        "scope_2_emissions": scope2Emissions,
        "scope_3_emissions": scope3Emissions,
        "total_emissions": totalEmissions,
        "listing_date": listingDate,
        "market_cap": marketCap,
        "ibkr_connection_id": ibkrConnectionId,
        "image": image?.toMap(),
        "createdBy": createdBy,
        "updatedBy": updatedBy?.toMap(),
        "price": price,
        "change_percent": changePercent,
        "holdings": holdings == null ? [] : List<dynamic>.from(holdings!.map((x) => x)),
        "sector_allocation":
            sectorAllocation == null ? [] : List<dynamic>.from(sectorAllocation!.map((x) => x)),
        "sustainable_investment_holding_percentage": sustainableInvestmentHoldingPercentage,
        "in_portfolio": inPortfolio,
      };
}

class Image {
  final int? id;
  final String? name;
  final dynamic alternativeText;
  final dynamic caption;
  final int? width;
  final int? height;
  final Formats? formats;
  final String? hash;
  final String? ext;
  final String? mime;
  final double? size;
  final String? url;
  final dynamic previewUrl;
  final String? provider;
  final dynamic providerMetadata;
  final String? folderPath;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Image({
    this.id,
    this.name,
    this.alternativeText,
    this.caption,
    this.width,
    this.height,
    this.formats,
    this.hash,
    this.ext,
    this.mime,
    this.size,
    this.url,
    this.previewUrl,
    this.provider,
    this.providerMetadata,
    this.folderPath,
    this.createdAt,
    this.updatedAt,
  });

  Image copyWith({
    int? id,
    String? name,
    dynamic alternativeText,
    dynamic caption,
    int? width,
    int? height,
    Formats? formats,
    String? hash,
    String? ext,
    String? mime,
    double? size,
    String? url,
    dynamic previewUrl,
    String? provider,
    dynamic providerMetadata,
    String? folderPath,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Image(
        id: id ?? this.id,
        name: name ?? this.name,
        alternativeText: alternativeText ?? this.alternativeText,
        caption: caption ?? this.caption,
        width: width ?? this.width,
        height: height ?? this.height,
        formats: formats ?? this.formats,
        hash: hash ?? this.hash,
        ext: ext ?? this.ext,
        mime: mime ?? this.mime,
        size: size ?? this.size,
        url: url ?? this.url,
        previewUrl: previewUrl ?? this.previewUrl,
        provider: provider ?? this.provider,
        providerMetadata: providerMetadata ?? this.providerMetadata,
        folderPath: folderPath ?? this.folderPath,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        id: json["id"],
        name: json["name"],
        alternativeText: json["alternativeText"],
        caption: json["caption"],
        width: json["width"],
        height: json["height"],
        formats: json["formats"] == null ? null : Formats.fromMap(json["formats"]),
        hash: json["hash"],
        ext: json["ext"],
        mime: json["mime"],
        size: json["size"]?.toDouble(),
        url: json["url"],
        previewUrl: json["previewUrl"],
        provider: json["provider"],
        providerMetadata: json["provider_metadata"],
        folderPath: json["folderPath"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "alternativeText": alternativeText,
        "caption": caption,
        "width": width,
        "height": height,
        "formats": formats?.toMap(),
        "hash": hash,
        "ext": ext,
        "mime": mime,
        "size": size,
        "url": url,
        "previewUrl": previewUrl,
        "provider": provider,
        "provider_metadata": providerMetadata,
        "folderPath": folderPath,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Formats {
  final Thumbnail? thumbnail;

  Formats({
    this.thumbnail,
  });

  Formats copyWith({
    Thumbnail? thumbnail,
  }) =>
      Formats(
        thumbnail: thumbnail ?? this.thumbnail,
      );

  factory Formats.fromJson(String str) => Formats.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Formats.fromMap(Map<String, dynamic> json) => Formats(
        thumbnail: json["thumbnail"] == null ? null : Thumbnail.fromMap(json["thumbnail"]),
      );

  Map<String, dynamic> toMap() => {
        "thumbnail": thumbnail?.toMap(),
      };
}

class Thumbnail {
  final String? ext;
  final String? url;
  final String? hash;
  final String? mime;
  final String? name;
  final dynamic path;
  final double? size;
  final int? width;
  final int? height;
  final int? sizeInBytes;

  Thumbnail({
    this.ext,
    this.url,
    this.hash,
    this.mime,
    this.name,
    this.path,
    this.size,
    this.width,
    this.height,
    this.sizeInBytes,
  });

  Thumbnail copyWith({
    String? ext,
    String? url,
    String? hash,
    String? mime,
    String? name,
    dynamic path,
    double? size,
    int? width,
    int? height,
    int? sizeInBytes,
  }) =>
      Thumbnail(
        ext: ext ?? this.ext,
        url: url ?? this.url,
        hash: hash ?? this.hash,
        mime: mime ?? this.mime,
        name: name ?? this.name,
        path: path ?? this.path,
        size: size ?? this.size,
        width: width ?? this.width,
        height: height ?? this.height,
        sizeInBytes: sizeInBytes ?? this.sizeInBytes,
      );

  factory Thumbnail.fromJson(String str) => Thumbnail.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Thumbnail.fromMap(Map<String, dynamic> json) => Thumbnail(
        ext: json["ext"],
        url: json["url"],
        hash: json["hash"],
        mime: json["mime"],
        name: json["name"],
        path: json["path"],
        size: json["size"]?.toDouble(),
        width: json["width"],
        height: json["height"],
        sizeInBytes: json["sizeInBytes"],
      );

  Map<String, dynamic> toMap() => {
        "ext": ext,
        "url": url,
        "hash": hash,
        "mime": mime,
        "name": name,
        "path": path,
        "size": size,
        "width": width,
        "height": height,
        "sizeInBytes": sizeInBytes,
      };
}

class UpdatedBy {
  final int? id;
  final String? firstname;
  final String? lastname;
  final dynamic username;
  final String? email;
  final String? password;
  final dynamic resetPasswordToken;
  final dynamic registrationToken;
  final bool? isActive;
  final bool? blocked;
  final dynamic preferedLanguage;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  UpdatedBy({
    this.id,
    this.firstname,
    this.lastname,
    this.username,
    this.email,
    this.password,
    this.resetPasswordToken,
    this.registrationToken,
    this.isActive,
    this.blocked,
    this.preferedLanguage,
    this.createdAt,
    this.updatedAt,
  });

  UpdatedBy copyWith({
    int? id,
    String? firstname,
    String? lastname,
    dynamic username,
    String? email,
    String? password,
    dynamic resetPasswordToken,
    dynamic registrationToken,
    bool? isActive,
    bool? blocked,
    dynamic preferedLanguage,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      UpdatedBy(
        id: id ?? this.id,
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        resetPasswordToken: resetPasswordToken ?? this.resetPasswordToken,
        registrationToken: registrationToken ?? this.registrationToken,
        isActive: isActive ?? this.isActive,
        blocked: blocked ?? this.blocked,
        preferedLanguage: preferedLanguage ?? this.preferedLanguage,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory UpdatedBy.fromJson(String str) => UpdatedBy.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UpdatedBy.fromMap(Map<String, dynamic> json) => UpdatedBy(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        resetPasswordToken: json["resetPasswordToken"],
        registrationToken: json["registrationToken"],
        isActive: json["isActive"],
        blocked: json["blocked"],
        preferedLanguage: json["preferedLanguage"],
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "email": email,
        "password": password,
        "resetPasswordToken": resetPasswordToken,
        "registrationToken": registrationToken,
        "isActive": isActive,
        "blocked": blocked,
        "preferedLanguage": preferedLanguage,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}
