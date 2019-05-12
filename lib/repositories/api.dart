import 'dart:convert';
import 'dart:async';
import 'package:asotech_client/repositories/model/response/human_location.dart';
import 'package:asotech_client/repositories/model/response/remaining_human.dart';
import 'package:asotech_client/repositories/model/response/room_id.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class IAsotechApiClient {
  Future<RoomId> createTheRoom(String userId);
  Future<bool> belongToTheRoom(String userId, String roomId);
  Future<bool> isAllMemberReady(String roomId);
  Future<RemainingHuman> getRemainingHumans(String userId, String roomId);
  Future<List<HumanLocation>> getHumansLocation(String userId, String roomId);
  Future<List<HumanLocation>> getHumanCollaborate(String userId, String roomId);
//   Future<String> createUserId(String )
}

class AsotechApiClient implements IAsotechApiClient{
  //TODO:mock Api url
  final baseUrl = DotEnv().env["BASE_URL"];
  final http.Client httpClient;
  AsotechApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<RoomId> createTheRoom(String userId) async {
    final readyUrl = 'http://35.221.92.18/rooms';
    Map header = {"user_id": userId};
    final response = await this.httpClient.post(readyUrl, headers: header);
    print(response);
    return RoomId.fromJson(json.decode(response.body));
  }

  Future<bool> belongToTheRoom(String userId, String roomId) async {
    final readyUrl = '$baseUrl/rooms/checkin';
    Map header = {"user_id": userId, "roomId": roomId};
    final response = await this.httpClient.get(readyUrl, headers: header);
    final responseJson = json.decode(response.body);
    return responseJson["status"];
  }

  Future<bool> isAllMemberReady(String roomId) async {
    final readyUrl = '$baseUrl/rooms/checkin/status';
    Map header = {"roomId": roomId};
    final response = await this.httpClient.get(readyUrl);
    final responseJson = json.decode(response.body);
    return responseJson["status"];
  }

  Future<RemainingHuman> getRemainingHumans(String userId, String roomId) async {
    final readyUrl = '$baseUrl/rooms/remaining/human';
    Map header = {"user_id": userId, "roomId": roomId};
    final response = await this.httpClient.get(readyUrl, headers: header);
    return RemainingHuman.fromJson(json.decode(response.body));
  }

  Future<List<HumanLocation>> getHumansLocation(String userId, String roomId) async {
    final readyUrl = '$baseUrl/rooms/humans/locations';
    Map header = {"user_id": userId, "roomId": roomId};
    final response = await this.httpClient.get(readyUrl, headers: header);
    Iterable list = json.decode(response.body);
    List<HumanLocation> humanLocation = list.map((i) => HumanLocation.fromJson(i)).toList();
    return humanLocation;
  }

  Future<List<HumanLocation>> getHumanCollaborate(String userId, String roomId) async {
    final readyUrl = '$baseUrl/rooms/humans/collaborat';
    Map header = {"user_id": userId, "roomId": roomId};
    final response = await this.httpClient.get(readyUrl, headers: header);
    Iterable list = json.decode(response.body);
    List<HumanLocation> humanLocation = list.map((i) => HumanLocation.fromJson(i)).toList();
    return humanLocation;
  }
}