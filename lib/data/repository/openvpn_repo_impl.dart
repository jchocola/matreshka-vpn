import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:matreshka_vpn/domain/repository/vpn_repository.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

class OpenvpnRepoImpl implements VPNRepository {
  late OpenVPN openvpn;
  VPNStage? _stage;
  VpnStatus? _status;

  final ValueNotifier<VPNStage?> stageNotifier = ValueNotifier<VPNStage?>(null);

  VpnStatus? get status => _status;
  VPNStage? get stage => _stage;

  @override
  Future<void> connect() async {
    try {
      // load vpn
      final ovpn = await rootBundle.loadString(
        'assets/openvpn/jchocola-hk2.vpnjantit-tcp-2501.ovpn',
      );

      // connect
      await openvpn.connect(
        ovpn,
        'My HONGKONG VPN',
        username: 'jchocola-vpnjantit.com',
        password: '2652002',
      );
      log('Open vpn connected');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> disconnect() async {
    try {
      openvpn.disconnect();
      log('Open vpn disconected');
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  Future<void> initialize() async {
    try {
      openvpn = OpenVPN(
        onVpnStatusChanged: (data) {
          _status = data;
          log('Status Changed $data');
        },
        onVpnStageChanged: (stage, rawStage) {
          _stage = stage;
          stageNotifier.value = stage; // notify listeners
          log('Stage changed $stage + $rawStage');
        },
      );

      await openvpn.initialize(
        groupIdentifier: "vn.matreshka.vpn",

        ///Example 'group.com.laskarmedia.vpn'
        providerBundleIdentifier: "NETWORK_EXTENSION_IDENTIFIER",

        ///Example 'id.laskarmedia.openvpnFlutterExample.VPNExtension'
        localizedDescription: "LOCALIZED_DESCRIPTION",

        ///Example 'Laskarmedia VPN'
      );

      log('Open vpn initialized');
    } catch (e) {
      log(e.toString());
    }
  }

  ///
  /// SINGLETON
  ///
  OpenvpnRepoImpl._contructor();
  static final OpenvpnRepoImpl _instance = OpenvpnRepoImpl._contructor();
  static OpenvpnRepoImpl get instance => _instance;
}
