import 'dart:async';

import 'package:asotech_client/models/models.dart';
import 'package:asotech_client/repositories/body/body.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:asotech_client/repositories/asotech_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:asotech_client/states/states.dart';
import 'package:asotech_client/events/events.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  final AsotechRepository asotechRepository;

  TimerBloc({@required this.asotechRepository});


  @override
  TimerState get initialState => TimerLoading();

  @override
  Stream<TimerState> mapEventToState(TimerEvent event) async* {
    if (event is TimerStart) {
      yield* _mapLoadTimeToState(event.createroom);
    } else if(event is Timefinish){

    }
  }

  Stream<TimerState> _mapLoadTimeToState( roomid) async* {
    try {
      final roomstatus = await this.asotechRepository.getReady(roomid);
      yield TimerLoaded(
        roomstatus
      );
    } catch (_) {
      yield TimerNotLoaded();
    }
  }

  Stream<TimerState> _mapLoadingTimeToState(CreateRoom createroom) async* {
    try {
      final roomcreate = await this.asotechRepository.createRoom(createroom.user_id, createroom.restrict_time);
      yield TimerLoaded(
        roomcreate
      );
    } catch (_) {
      yield TimerNotLoaded();
    }
  }

  @override
  void dispose() {
    //subscription.cancel();
    super.dispose();
  }
}
