import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:matreshka_vpn/data/model/internet_info_model.dart';
import 'package:matreshka_vpn/data/repository/ip_repo_impl.dart';
import 'package:matreshka_vpn/data/repository/openvpn_repo_impl.dart';

import 'package:matreshka_vpn/domain/repository/openvpn_repository.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

class DefencePageProvider extends ChangeNotifier {
  final OpenvpnRepoImpl openvpnRepository;
  final IpRepoImpl ipRepoImpl;
  DefencePageProvider({
    required this.openvpnRepository,
    required this.ipRepoImpl,
  }) {
    openvpnRepository.initialize();
    loadInternetInfoModel();

    openvpnRepository.stageNotifier.addListener(_onStageChanged);
  }
  bool isProtected = false;
  bool isOpenVPNrunning = false;
  InternetInfoModel? internetInfoModel;

  void _onStageChanged() async {
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
    openvpnRepository.stageNotifier.removeListener(_onStageChanged);
    super.dispose();
  }

  ///
  /// OPEN VPN
  ///
  Future<void> openVpnConnect() async {
    await openvpnRepository.connect();
  }

  Future<void> openVpnDisconnect() async {
    await openvpnRepository.disconnect();
  }
}
