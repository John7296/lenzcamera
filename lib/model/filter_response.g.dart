// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilterResponse _$FilterResponseFromJson(Map<String, dynamic> json) =>
    FilterResponse()
      ..filterproducts = (json['categoryList"'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList()
      ..filterattributes = (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attributes.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$FilterResponseToJson(FilterResponse instance) =>
    <String, dynamic>{
      'categoryList"': instance.filterproducts,
      'attributes': instance.filterattributes,
    };
