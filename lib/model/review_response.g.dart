// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewResponse _$ReviewResponseFromJson(Map<String, dynamic> json) =>
    ReviewResponse()
      ..reviewDetails = (json['ReviewDetails'] as List<dynamic>?)
          ?.map((e) => ReviewDetails.fromJson(e as Map<String, dynamic>))
          .toList()
      ..details = json['Details'] == null
          ? null
          : Details.fromJson(json['Details'] as Map<String, dynamic>)
      ..prodRev = (json['ProdRev'] as List<dynamic>?)
          ?.map((e) => ProductReview.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$ReviewResponseToJson(ReviewResponse instance) =>
    <String, dynamic>{
      'ReviewDetails': instance.reviewDetails,
      'Details': instance.details,
      'ProdRev': instance.prodRev,
    };
