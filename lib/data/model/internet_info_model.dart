class InternetInfoModel {
  final String? ip;
  final String? continentCode;
  final String? country;
  final double? latitude;
  final double? longitude;
  final String? timeZone;
  final String? region;
  InternetInfoModel({
    this.ip,
    this.continentCode,
    this.country,
    this.latitude,
    this.longitude,
    this.timeZone,
    this.region,
  });

  @override
  String toString() {
    return 'InternetInfoModel(ip: $ip, continentCode: $continentCode, country: $country, latitude: $latitude, longitude: $longitude, timeZone: $timeZone, region: $region)';
  }
}
