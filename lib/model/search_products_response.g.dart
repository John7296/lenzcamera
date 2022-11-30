// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_products_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchProductsResponse _$SearchProductsResponseFromJson(
        Map<String, dynamic> json) =>
    SearchProductsResponse()
      ..products = (json['List'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$SearchProductsResponseToJson(
        SearchProductsResponse instance) =>
    <String, dynamic>{
      'List': instance.products,
    };
