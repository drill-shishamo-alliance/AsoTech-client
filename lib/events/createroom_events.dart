import 'dart:async';

import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreateRoomEvent extends Equatable {
CreateRoomEvent([List props = const []]) : super(props);
}

class CreateLoad extends CreateRoomEvent {
  final  CreateRoomBody body;

  CreateLoad({@required this.body})
      : assert(body != null),
        super([body]);
}

class CreateLoded extends CreateRoomEvent {}

