// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'human_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HumanLocation _$HumanLocationFromJson(Map<String, dynamic> json) {
  return HumanLocation(
      userId: json['user_id'] as String,
      latitude: (json['latitude'] as num)?.toDouble(),
      longitude: (json['longitude'] as num)?.toDouble());
}

Map<String, dynamic> _$HumanLocationToJson(HumanLocation instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'latitude': instance.latitude,
      'longitude': instance.longitude
    };
