import 'package:flutter/material.dart';
import 'package:matreshka_vpn/data/repository/openvpn_repo_impl.dart';

import 'package:matreshka_vpn/domain/repository/openvpn_repository.dart';
import 'package:openvpn_flutter/openvpn_flutter.dart';

class DefencePageProvider extends ChangeNotifier {
  final OpenvpnRepoImpl openvpnRepository;
  DefencePageProvider({required this.openvpnRepository}) {
    openvpnRepository.initialize();

     openvpnRepository.stageNotifier.addListener(_onStageChanged);
  }
  bool isProtected = false;
  bool isOpenVPNrunning = false;


    void _onStageChanged() {
    final s = openvpnRepository.stageNotifier.value;
    if (s == VPNStage.connected) {
      isProtected = true;
      isOpenVPNrunning = true;
      notifyListeners();
    } else if (s == VPNStage.disconnected) {
      isProtected = false;
      isOpenVPNrunning = false;
      notifyListeners();
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
