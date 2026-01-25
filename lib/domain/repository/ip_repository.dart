import 'package:matreshka_vpn/data/model/internet_info_model.dart';

abstract class IpRepository {
  Future<InternetInfoModel> getAllInfoAboutInternet();
}
