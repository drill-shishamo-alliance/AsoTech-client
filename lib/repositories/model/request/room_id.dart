import 'package:json_annotation/json_annotation.dart';

part 'room_id.g.dart';

@JsonSerializable()
class RoomId {
  @JsonKey(name: 'room_id')
  final String value;
  RoomId({this.value});

  factory RoomId.fromJson(Map<String, dynamic> json) => _$RoomIdFromJson(json);

  Map<String, dynamic> toJson() => _$RoomIdToJson(this);
}