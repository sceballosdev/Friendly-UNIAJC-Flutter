import 'package:json_annotation/json_annotation.dart';

part 'pollution_entity.g.dart';

@JsonSerializable()
class PollutionEntity {
  PollutionEntity({this.year, this.place, this.quantity});

  int year;
  String place;
  int quantity;

  factory PollutionEntity.fromJson(Map<String, dynamic> json) =>
      _$PollutionEntityFromJson(json);
  Map<String, dynamic> toJson() => _$PollutionEntityToJson(this);
}
