import 'package:equatable/equatable.dart';


class HumansLocation extends Equatable {
  final String human_id;
  final num longitude;
  final num latitude;

  HumansLocation(this.human_id, this.longitude, this.latitude) : super([human_id, longitude, latitude]);
}