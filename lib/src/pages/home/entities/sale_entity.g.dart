// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SaleEntity _$SaleEntityFromJson(Map<String, dynamic> json) {
  return SaleEntity(
      yearval: json['yearval'] as int, salesval: json['salesval'] as int);
}

Map<String, dynamic> _$SaleEntityToJson(SaleEntity instance) =>
    <String, dynamic>{
      'yearval': instance.yearval,
      'salesval': instance.salesval
    };
