// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'related_products.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RelatedProducts _$RelatedProductsFromJson(Map<String, dynamic> json) =>
    RelatedProducts()
      ..relatedproducts = (json['RelatedList'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$RelatedProductsToJson(RelatedProducts instance) =>
    <String, dynamic>{
      'RelatedList': instance.relatedproducts,
    };
