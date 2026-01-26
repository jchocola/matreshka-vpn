import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matreshka_vpn/data/model/internet_info_model.dart';
import 'package:matreshka_vpn/data/repository/ip_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/openvpn_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/vless_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/wire_guard_repo_impl.dart';

import 'package:openvpn_flutter/openvpn_flutter.dart';
import 'package:wireguard_flutter/wireguard_flutter_platform_interface.dart'
    show VpnStage;

class DefencePageProvider extends ChangeNotifier {
  final OpenvpnRepoImpl openvpnRepository;
  final IpRepoImpl ipRepoImpl;
  final WireGuardRepoImpl wireGuardRepository;
  final VlessRepoImpl vlessRepository;
  StreamSubscription<VpnStage>? _wgSub;
  DefencePageProvider({
    required this.openvpnRepository,
    required this.ipRepoImpl,
    required this.wireGuardRepository,
    required this.vlessRepository,
  }) {
    //INITIALIZE
    openvpnRepository.initialize();
    openvpnRepository.stageNotifier.addListener(_onOpenStageChanged);

    wireGuardRepository.initialize();
    // подписываемся один раз при создании провайдера
    _wgSub = wireGuardRepository.stageStream.listen((stage) {
      if (stage == VpnStage.connected) {
        isProtected = true;
        isWireGuardrunning = true;
        notifyListeners();
      }
      if (stage == VpnStage.disconnected) {
        isProtected = false;
        isWireGuardrunning = false;
        notifyListeners();
      }
    });

    vlessRepository.initialize();

    loadInternetInfoModel();
  }

  bool isloading = false;
  bool isProtected = false;
  bool isOpenVPNrunning = false;
  bool isWireGuardrunning = false;
  bool isVlessrunning = false;
  InternetInfoModel? internetInfoModel;

  void startLoading() {
    isloading = true;
    notifyListeners();
  }

  void stopLoading() {
    isloading = false;
    notifyListeners();
  }

  Future<void> loadInternetInfoModel() async {
    try {
      internetInfoModel = await ipRepoImpl.getAllInfoAboutInternet();
      log(internetInfoModel.toString());
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void dispose() {
    openvpnRepository.stageNotifier.removeListener(_onOpenStageChanged);
    _wgSub?.cancel();
    super.dispose();
  }

  ///
  /// OPEN VPN
  ///
  Future<void> openVpnConnect() async {
    try {
      startLoading();
      await openvpnRepository.connect();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> openVpnDisconnect() async {
    await openvpnRepository.disconnect();
  }

  void _onOpenStageChanged() async {
    final s = openvpnRepository.stageNotifier.value;
    if (s == VPNStage.connected) {
      isProtected = true;
      isOpenVPNrunning = true;
      await loadInternetInfoModel();
      notifyListeners();
    } else if (s == VPNStage.disconnected) {
      isProtected = false;
      isOpenVPNrunning = false;
      await loadInternetInfoModel();
      notifyListeners();
    }
  }

  ///
  /// WIREGUARD
  ///
  Future<void> wireguardConnect() async {
    try {
      log('Wireguard conect');
      await wireGuardRepository.connect();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> wireguardStopConnect() async {
    try {
      log('Wireguard stop');
      await wireGuardRepository.disconnect();
    } catch (e) {
      log(e.toString());
    }
  }

  ///
  /// VLESS
  ///
  Future<void> vlessConnect() async {
    try {
      log('Vless conect');
      await vlessRepository.connect();

      isVlessrunning = true;
      isProtected = true;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> vlessStopConnect() async {
    try {
      log('Vless stop');
      await vlessRepository.disconnect();

      isVlessrunning = false;
      isProtected = false;
      notifyListeners();
    } catch (e) {
      log(e.toString());
    }
  }
}
