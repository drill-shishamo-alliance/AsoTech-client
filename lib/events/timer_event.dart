import 'dart:async';

import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class TimerEvent extends Equatable {
  TimerEvent([List props = const []]) : super(props);
}

class TimerStart extends TimerEvent {
  final CreateRoomBody createroom;

  TimerStart(this.createroom) : super([createroom]);
}

class Timefinish extends TimerEvent {}

void handleTimeout() {  // callback function

}