// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetail _$ProductDetailFromJson(Map<String, dynamic> json) =>
    ProductDetail()
      ..productDetails = (json['ProdDetails'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList()
      ..relatedList = (json['RelatedList'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList()
      ..productImages = (json['ProdImages'] as List<dynamic>?)
          ?.map((e) => ProductImages.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ProductDetailToJson(ProductDetail instance) =>
    <String, dynamic>{
      'ProdDetails': instance.productDetails,
      'RelatedList': instance.relatedList,
      'ProdImages': instance.productImages,
    };
