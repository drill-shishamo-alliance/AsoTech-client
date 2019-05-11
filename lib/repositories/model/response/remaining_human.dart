import 'package:json_annotation/json_annotation.dart';

part 'remaining_human.g.dart';

@JsonSerializable()
class RemainingHuman {
  @JsonKey(name: 'remaining_human')
  final String value;
  RemainingHuman({this.value});

  factory RemainingHuman.fromJson(Map<String, dynamic> json) => _$RemainingHumanFromJson(json);

  Map<String, dynamic> toJson() => _$RemainingHumanToJson(this);
}