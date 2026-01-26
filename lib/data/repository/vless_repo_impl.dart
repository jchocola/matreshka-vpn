import 'dart:developer';

import 'package:flutter_v2ray_plus/flutter_v2ray.dart';
import 'package:matreshka_vpn/domain/repository/vpn_repository.dart';

class VlessRepoImpl implements VPNRepository {
  late final FlutterV2ray _flutterV2Ray;

  @override
  Future<void> connect() async {
    try {
      //vless://4075209c-fa5f-11f0-8c75-770c55ca708c@br4.vpnjantit.com:10002?encryption=none&security=tls&type=ws&path=%2fvpnjantit#nguyentb-vpnjantit.com
      // vless://4075209c-fa5f-11f0-8c75-770c55ca708c@br4.vpnjantit.com:10004?encryption=none&security=none&type=ws&path=%2fvpnjantit#nguyentb-vpnjantit.com
      final parser = FlutterV2ray.parseFromURL(
        "vless://4075209c-fa5f-11f0-8c75-770c55ca708c@br4.vpnjantit.com:10002?encryption=none&security=tls&type=ws&path=%2fvpnjantit#nguyentb-vpnjantit.com",
      );
      final String config = parser.getFullConfiguration();

      final int delayMs = await _flutterV2Ray.getServerDelay(config: config);
      print('Server delay: ${delayMs}ms');

      final bool allowed = await _flutterV2Ray.requestPermission();
      if (!allowed) return;

      await _flutterV2Ray.startVless(remark: parser.remark, config: config);
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> disconnect() async {
    try {
       await _flutterV2Ray.stopVless();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> initialize() async {
    try {
      _flutterV2Ray = FlutterV2ray();
      await _flutterV2Ray.initializeVless(
        providerBundleIdentifier: "matreshka_vpn.vn",
        groupIdentifier: "matreshka_vpn.vn",
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
