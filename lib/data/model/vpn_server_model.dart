
import 'dart:convert';

import 'package:matreshka_vpn/domain/entity/vpn_server.dart';

class VpnServerModel {
 final String country;
  final String city;
  final String flag;
  final int speed;
  final int overFill;
  VpnServerModel({
    required this.country,
    required this.city,
    required this.flag,
    required this.speed,
    required this.overFill,
  });


  Map<String, dynamic> toMap() {
    return {
      'country': country,
      'city': city,
      'flag': flag,
      'speed': speed,
      'overFill': overFill,
    };
  }

  factory VpnServerModel.fromMap(Map<String, dynamic> map) {
    return VpnServerModel(
      country: map['country'] ?? '',
      city: map['city'] ?? '',
      flag: map['flag'] ?? '',
      speed: map['speed']?.toInt() ?? 0,
      overFill: map['overFill']?.toInt() ?? 0,
    );
  }

  // VpnServer toEntity (){
  //   return VpnServer(
      
  //   );
  // }

  String toJson() => json.encode(toMap());

  factory VpnServerModel.fromJson(String source) => VpnServerModel.fromMap(json.decode(source));
}
