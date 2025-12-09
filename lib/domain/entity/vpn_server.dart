import 'package:equatable/equatable.dart';

 class VpnServer extends Equatable {
  final String country;
  final String city;
  final String flag;
  final int speed;
  final int overFill;

  const VpnServer({
    required this.country,
    required this.city,
    required this.flag,
    required this.speed,
    required this.overFill
  });

  @override
  List<Object?> get props => [country, city, flag, speed , overFill];
}
