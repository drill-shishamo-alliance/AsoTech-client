import 'package:equatable/equatable.dart';


class RoomStatus extends Equatable {
  final bool readystate;

  RoomStatus(this.readystate) : super([readystate]);
}