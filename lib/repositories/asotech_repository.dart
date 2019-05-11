import 'dart:async';
import 'package:asotech_client/repositories/model/response/human_location.dart';
import 'package:asotech_client/repositories/model/response/remaining_human.dart';
import 'package:asotech_client/repositories/model/response/room_id.dart';
import 'package:meta/meta.dart';
import 'package:asotech_client/repositories/api.dart';

abstract class IAsotechRepository {
  Future<RoomId> createTheRoom(String userId);
  Future<bool> belongToTheRoom(String userId, String roomId);
  Future<bool> isAllMemberReady(String roomId);
  Future<RemainingHuman> getRemainingHumans(String userId, String roomId);
  Future<List<HumanLocation>> getHumansLocation(String userId, String roomId);
  Future<List<HumanLocation>> getHumanCollaborate(String userId, String roomId);
}

class AsotechRepository {
  final IAsotechApiClient asotechApiClient;

  AsotechRepository({@required this.asotechApiClient}): assert(asotechApiClient != null);

  Future<RoomId> createTheRoom(String userId) async {
    return asotechApiClient.createTheRoom(userId);
  }

  Future<bool> belongToTheRoom(String userId, String roomId) async {
   return asotechApiClient.belongToTheRoom(userId, roomId);
  }

  Future<bool> isAllMemberReady(String roomId) async {
    return asotechApiClient.isAllMemberReady(roomId);
  }

  Future<RemainingHuman> getRemainingHumans(String userId, String roomId) async {
    return asotechApiClient.getRemainingHumans(userId, roomId);
  }

  Future<List<HumanLocation>> getHumansLocation(String userId, String roomId) async {
    return asotechApiClient.getHumansLocation(userId, roomId);
  }

  Future<List<HumanLocation>> getHumanCollaborate(String userId, String roomId) async {
    return asotechApiClient.getHumanCollaborate(userId, roomId);
  }
}

