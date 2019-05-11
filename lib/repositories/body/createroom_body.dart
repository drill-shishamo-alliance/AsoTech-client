import 'package:equatable/equatable.dart';


class CreateRoomBody extends Equatable {
    final String user_id;
    final num restrict_time;

  CreateRoomBody(this.user_id, this.restrict_time) : super([user_id,restrict_time]);
}