import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:matreshka_vpn/domain/repository/vpn_repository.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';

class WireGuardRepoImpl implements VPNRepository {
  final wireguard = WireGuardFlutter.instance;

    final ValueNotifier<VPNStage?> stageNotifier = ValueNotifier<VPNStage?>(null);

  @override
  Future<void> connect() async {
    try {
      // prepare config
      final config = await rootBundle.loadString(
        'assets/wire_guard/nguyentb-gr3jan.conf',
      );
      log(config);
      await wireguard.startVpn(
        serverAddress:
            "gr3.vpnjantit.com", // the server address (e.g 'demo.wireguard.com:51820')
        wgQuickConfig: config, // the quick-config file
        providerBundleIdentifier: 'matreshka.vpn', // your app identifier
      );

      wireguard.vpnStageSnapshot.
      
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      await wireguard.stopVpn();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> initialize() async {
    try {
      await wireguard.initialize(interfaceName: 'wg0');
    } catch (e) {
      log(e.toString());
    }
  }
}
