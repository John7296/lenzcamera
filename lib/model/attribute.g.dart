// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attribute.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Attribute _$AttributeFromJson(Map<String, dynamic> json) => Attribute(
      attrValue: json['attrValue'] as String?,
      attrName: json['attrName'] as String?,
      brandName: json['brandName'] as String?,
      attrId: json['attrId'] as int?,
      attrValueId: json['attrValueId'] as int?,
      productCount: json['ProductCount'] as int?,
      imageUrl: json['imageUrl'] as String?,
      imageIcon: json['imageIcon'] as String?,
      showInHome: json['ShowInHome'] as bool?,
      brandDetailId: json['brandDetailId'] as int?,
    );

Map<String, dynamic> _$AttributeToJson(Attribute instance) => <String, dynamic>{
      'attrValue': instance.attrValue,
      'attrName': instance.attrName,
      'brandName': instance.brandName,
      'attrId': instance.attrId,
      'attrValueId': instance.attrValueId,
      'ProductCount': instance.productCount,
      'imageUrl': instance.imageUrl,
      'imageIcon': instance.imageIcon,
      'ShowInHome': instance.showInHome,
      'brandDetailId': instance.brandDetailId,
    };
