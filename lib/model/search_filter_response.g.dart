// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_filter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchFilterResponse _$SearchFilterResponseFromJson(
        Map<String, dynamic> json) =>
    SearchFilterResponse()
      ..categoryList = (json['categoryList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList()
      ..attributes = (json['attributes'] as List<dynamic>?)
          ?.map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList()
      ..minPrize = (json['minPrize'] as num?)?.toDouble()
      ..maxPrize = (json['maxPrize'] as num?)?.toDouble();

Map<String, dynamic> _$SearchFilterResponseToJson(
        SearchFilterResponse instance) =>
    <String, dynamic>{
      'categoryList': instance.categoryList,
      'attributes': instance.attributes,
      'minPrize': instance.minPrize,
      'maxPrize': instance.maxPrize,
    };
