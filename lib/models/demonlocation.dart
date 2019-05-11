import 'package:equatable/equatable.dart';

class DemonLocation extends Equatable {
  final String demon_id;
  final num longitude;
  final num latitude;

  DemonLocation(this.demon_id, this.longitude, this.latitude) : super([demon_id, longitude, latitude]);
}
