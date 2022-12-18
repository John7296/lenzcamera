// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_review.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductReview _$ProductReviewFromJson(Map<String, dynamic> json) =>
    ProductReview(
      rating1: json['rating1'] as int?,
      rating2: json['rating2'] as int?,
      rating3: json['rating3'] as int?,
      rating4: json['rating4'] as int?,
      rating5: json['rating5'] as int?,
      review_count: json['review_count'] as int?,
      TotalCount: json['TotalCount'] as int?,
      IsReviewAvgrating: (json['IsReviewAvgrating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductReviewToJson(ProductReview instance) =>
    <String, dynamic>{
      'rating1': instance.rating1,
      'rating2': instance.rating2,
      'rating3': instance.rating3,
      'rating4': instance.rating4,
      'rating5': instance.rating5,
      'review_count': instance.review_count,
      'TotalCount': instance.TotalCount,
      'IsReviewAvgrating': instance.IsReviewAvgrating,
    };
