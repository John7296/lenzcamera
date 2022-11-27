// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedProducts _$FeaturedProductsFromJson(Map<String, dynamic> json) =>
    FeaturedProducts(
      catName: json['catName'] as String?,
      imageUrl: json['imageUrl'] as String?,
      parentId: json['parentId'] as int?,
      catId: json['catId'] as int?,
      prName: json['prName'] as String?,
      venderName: json['venderName'] as String?,
    );

Map<String, dynamic> _$FeaturedProductsToJson(FeaturedProducts instance) =>
    <String, dynamic>{
      'venderName': instance.venderName,
      'catName': instance.catName,
      'catId': instance.catId,
      'prName': instance.prName,
      'parentId': instance.parentId,
      'imageUrl': instance.imageUrl,
    };
