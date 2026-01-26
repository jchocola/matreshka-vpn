import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matreshka_vpn/domain/repository/vpn_repository.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter.dart';

class WireGuardRepoImpl implements VPNRepository {
  final wireguard = WireGuardFlutter.instance;

Stream<VpnStage> get stageStream => wireguard.vpnStageSnapshot;

StreamSubscription<VpnStage> listenStage(void Function(VpnStage) onData,
          {Function? onError, void Function()? onDone, bool? cancelOnError}) =>
      wireguard.vpnStageSnapshot.listen(onData,
          onError: onError, onDone: onDone, cancelOnError: cancelOnError);

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

    Future<VpnStage> stage ()async{
      return  await wireguard.stage();
    } 
}
