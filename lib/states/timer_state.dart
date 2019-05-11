import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class TimerState extends Equatable {
TimerState([List props = const []]) : super(props);
}

class Initial extends TimerState {}

class TimerLoading extends TimerState {
  @override
  String toString() => 'TodosLoading';
}

class TimerLoaded extends TimerState {
  final List<CreateRoomBody> roomcreate;

  TimerLoaded([this.roomcreate = const []]) : super([roomcreate]);

  @override
  String toString() => 'TodosLoaded { todos: $roomcreate }';
}

class TimerNotLoaded extends TimerState {
  @override
  String toString() => 'TodosNotLoaded';
}