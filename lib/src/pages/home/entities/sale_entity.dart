import 'package:flutter/painting.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sale_entity.g.dart';

@JsonSerializable()
class SaleEntity {
  SaleEntity({this.yearval, this.salesval});

  int yearval;
  int salesval;

  factory SaleEntity.fromJson(Map<String, dynamic> json) =>
      _$SaleEntityFromJson(json);
  Map<String, dynamic> toJson() => _$SaleEntityToJson(this);
}