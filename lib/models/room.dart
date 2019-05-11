import 'package:equatable/equatable.dart';


class Room extends Equatable {
  final String roomid;

  Room(this.roomid) : super([roomid]);
}