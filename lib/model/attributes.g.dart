// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attributes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      attrValue: json['attrValue'] as String?,
      attrName: json['attrName'] as String?,
      brandName: json['brandName'] as String?,
      attrId: json['attrId'] as int?,
      attrValueId: json['attrValueId'] as int?,
      ProductCount: json['ProductCount'] as int?,
      imageUrl: json['imageUrl'] as String?,
      imageIcon: json['imageIcon'] as String?,
      ShowInHome: json['ShowInHome'] as String?,
      brandDetailId: json['brandDetailId'] as int?,
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'attrValue': instance.attrValue,
      'attrName': instance.attrName,
      'brandName': instance.brandName,
      'attrId': instance.attrId,
      'attrValueId': instance.attrValueId,
      'ProductCount': instance.ProductCount,
      'imageUrl': instance.imageUrl,
      'imageIcon': instance.imageIcon,
      'ShowInHome': instance.ShowInHome,
      'brandDetailId': instance.brandDetailId,
    };
