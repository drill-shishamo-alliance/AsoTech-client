import 'package:equatable/equatable.dart';


class JoinRoomBody extends Equatable {
    final num user_id;

  JoinRoomBody(this.user_id) : super([user_id]);
}