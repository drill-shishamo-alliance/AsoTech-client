import 'package:equatable/equatable.dart';


class RoomStatus extends Equatable {
    final num user_id;
    final num restrict_time;

  RoomStatus(this.user_id, this.restrict_time) : super([user_id,restrict_time]);
}