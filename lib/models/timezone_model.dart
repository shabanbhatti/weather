class TimezoneModel {
  final String? status;
  final String? message;
  final String? countryCode;
  final String? countryName;
  final String? regionName;
  final String? cityName;
  final String? zoneName;
  final String? abbreviation;
  final int? gmtOffset;
  final String? dst;
  final int? zoneStart;
  final int? zoneEnd;
  final String? nextAbbreviation;
  final int? timestamp;
  final String? formatted;

  TimezoneModel({
    this.status,
    this.message,
    this.countryCode,
    this.countryName,
    this.regionName,
    this.cityName,
    this.zoneName,
    this.abbreviation,
    this.gmtOffset,
    this.dst,
    this.zoneStart,
    this.zoneEnd,
    this.nextAbbreviation,
    this.timestamp,
    this.formatted,
  });

  factory TimezoneModel.fromJson(Map<String, dynamic> json) {
    return TimezoneModel(
      status: json['status'] as String?,
      message: json['message'] as String?,
      countryCode: json['countryCode'] as String?,
      countryName: json['countryName'] as String?,
      regionName: json['regionName'] as String?,
      cityName: json['cityName'] as String?,
      zoneName: json['zoneName'] as String?,
      abbreviation: json['abbreviation'] as String?,
      gmtOffset: json['gmtOffset'] as int?,
      dst: json['dst']?.toString(),
      zoneStart: json['zoneStart'] as int?,
      zoneEnd: json['zoneEnd'] as int?,
      nextAbbreviation: json['nextAbbreviation']?.toString(),
      timestamp: json['timestamp'] as int?,
      formatted: json['formatted'] as String?,
    );
  }
}
