// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      cusId: json['cusId'] as int?,
      reviewId: json['reviewId'] as int?,
      productId: json['productId'] as int?,
      dateOfReview: json['dateOfReview'] as String?,
      reviewTitle: json['reviewTitle'] as String?,
      reviewDetails: json['reviewDetails'] as String?,
      rating: json['rating'] as int?,
      reviewerName: json['reviewerName'] as String?,
      reviewerEmail: json['reviewerEmail'] as String?,
      status: json['status'] as String?,
      delDate: json['delDate'] as String?,
      Product: json['Product'] as String?,
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'cusId': instance.cusId,
      'reviewId': instance.reviewId,
      'productId': instance.productId,
      'dateOfReview': instance.dateOfReview,
      'reviewTitle': instance.reviewTitle,
      'reviewDetails': instance.reviewDetails,
      'rating': instance.rating,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
      'status': instance.status,
      'delDate': instance.delDate,
      'Product': instance.Product,
    };
