// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pollution_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PollutionEntity _$PollutionEntityFromJson(Map<String, dynamic> json) {
  return PollutionEntity(
      year: json['year'] as int,
      place: json['place'] as String,
      quantity: json['quantity'] as int);
}

Map<String, dynamic> _$PollutionEntityToJson(PollutionEntity instance) =>
    <String, dynamic>{
      'year': instance.year,
      'place': instance.place,
      'quantity': instance.quantity
    };
