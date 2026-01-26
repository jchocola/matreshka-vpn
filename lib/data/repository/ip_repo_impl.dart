import 'dart:async';
import 'dart:developer';

import 'package:matreshka_vpn/data/model/internet_info_model.dart';
import 'package:matreshka_vpn/domain/repository/ip_repository.dart';
import 'package:network_info_plus/network_info_plus.dart';
import 'package:vpn_info/vpn_info.dart';

class IpRepoImpl implements IpRepository {
  final info = NetworkInfo();

  @override
  Future<InternetInfoModel> getAllInfoAboutInternet() async {
    try {
      log('getAllInfoAboutInternet: start');
      print('getAllInfoAboutInternet: start');

      final wifiIP = await info.getWifiIP();
      var addresses = await VpnInfo.getConnectedVpnAddresses();
      // String country = await _ipAddress.getCountry();
      // double latitude = await _ipAddress.getLatitude();
      // double longtitude = await _ipAddress.getLongitude();
      // String timeZone = await _ipAddress.getTimeZone();
      // String region = await _ipAddress.getRegion();
      log(addresses.toString());
      log('Ip : $wifiIP');
      return InternetInfoModel(
        ip: wifiIP,
        continentCode: addresses?[0].address ?? '',
        // country: country,
        // latitude: latitude,
        // longitude: longtitude,
        // timeZone: timeZone,
        // region: region,
      );
    } catch (e) {
      log(e.toString());
      throw Exception('error');
    }
  }

  IpRepoImpl._contructor();
  static final IpRepoImpl _instance = IpRepoImpl._contructor();

  static IpRepoImpl get instance => _instance;
}
