import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

const String userid = "efwiuguaogrhrugeaigo";

@immutable
class CreateRoomState extends Equatable {
CreateRoomState([List props = const []]) : super(props);
}

class Initial extends CreateRoomState {}

class CreateRoomLoading extends CreateRoomState {
  @override
  String toString() => 'TodosLoading';
}

class CreateRoomLoaded extends CreateRoomState {
  final Room room;

  CreateRoomLoaded({@required this.room})
      : assert(room != null),
        super([room]);

  @override
  String toString() => 'TodosLoaded { todos: $userid }';
}

class CreateRoomNotLoaded extends CreateRoomState {
  @override
  String toString() => 'TodosNotLoaded';
}