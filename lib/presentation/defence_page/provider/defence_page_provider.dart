import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matreshka_vpn/data/model/internet_info_model.dart';
import 'package:matreshka_vpn/data/repository/ip_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/openvpn_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/wire_guard_repo_impl.dart';

import 'package:matreshka_vpn/domain/repository/vpn_repository.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

class DefencePageProvider extends ChangeNotifier {
  final OpenvpnRepoImpl openvpnRepository;
  final IpRepoImpl ipRepoImpl;
  final WireGuardRepoImpl wireGuardRepository;
  DefencePageProvider({
    required this.openvpnRepository,
    required this.ipRepoImpl,
    required this.wireGuardRepository,
  }) {
    //INITIALIZE
    openvpnRepository.initialize();
    openvpnRepository.stageNotifier.addListener(_onOpenStageChanged);


    wireGuardRepository.initialize();
    wireGuardRepository.wireguard.s
    loadInternetInfoModel();
  }

  bool isloading = false;
  bool isProtected = false;
  bool isOpenVPNrunning = false;
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

  void _onWireguardStageChanged()async {

  }
}
