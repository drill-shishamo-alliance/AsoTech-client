import 'dart:async';

import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:asotech_client/repositories/asotech_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:asotech_client/states/states.dart';
import 'package:asotech_client/events/events.dart';

const String userid = "efwiuguaogrhrugeaigo";

class CreateRoomBloc extends Bloc<CreateRoomEvent, CreateRoomState> {
  final AsotechRepository asotechRepository;

  CreateRoomBloc({@required this.asotechRepository});


  @override
  CreateRoomState get initialState => CreateRoomLoading();

  @override
  Stream<CreateRoomState> mapEventToState(CreateRoomEvent event) async* {
    if (event is CreateRoomEvent) {
      yield* _getuserToState(event.);
    } else if(event is Timefinish){

    }
  }

  Stream<CreateRoomState> _getuserToState(String userid, ) async* {
    try {
      final room = await this.asotechRepository.createRoom(userid, time);
      yield CreateRoomLoaded(
        room: room
      );
    } catch (_) {
      yield CreateRoomNotLoaded();
    }
  }

  // Stream<CreateRoomState> _mapLoadingTimeToState(CreateRoom createroom) async* {
  //   try {
  //     final roomcreate = await this.asotechRepository.createRoom(createroom.user_id, createroom.restrict_time);
  //     yield CreateRoomLoaded(
  //       roomcreate
  //     );
  //   } catch (_) {
  //     yield CreateRoomNotLoaded();
  //   }
  // }

  @override
  void dispose() {
    //subscription.cancel();
    super.dispose();
  }
}
