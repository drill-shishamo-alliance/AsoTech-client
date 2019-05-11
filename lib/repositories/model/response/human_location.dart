import 'package:json_annotation/json_annotation.dart';

part 'human_location.g.dart';

@JsonSerializable()
class HumanLocation {
  @JsonKey(name: 'user_id')
  final String userId;
  final double latitude;
  final double longitude;
  HumanLocation({this.userId, this.latitude, this.longitude});

  factory HumanLocation.fromJson(Map<String, dynamic> json) => _$HumanLocationFromJson(json);

  Map<String, dynamic> toJson() => _$HumanLocationToJson(this);
}