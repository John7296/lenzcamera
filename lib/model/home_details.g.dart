// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeDetails _$HomeDetailsFromJson(Map<String, dynamic> json) => HomeDetails(
      additional_banners: (json['additional_banners'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      bestseller_products: (json['bestseller_products'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured_products: (json['featured_products'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      featured_restuarants: (json['featured_restuarants'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      newest_restuarants: (json['newest_restuarants'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      offer_banners: (json['offer_banners'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      slider_banners: (json['slider_banners'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      trending_restuarants: (json['trending_restuarants'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      web_sliders: (json['web_sliders'] as List<dynamic>?)
          ?.map((e) => HomeDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeDetailsToJson(HomeDetails instance) =>
    <String, dynamic>{
      'featured_restuarants': instance.featured_restuarants,
      'newest_restuarants': instance.newest_restuarants,
      'trending_restuarants': instance.trending_restuarants,
      'slider_banners': instance.slider_banners,
      'additional_banners': instance.additional_banners,
      'featured_products': instance.featured_products,
      'bestseller_products': instance.bestseller_products,
      'web_sliders': instance.web_sliders,
      'offer_banners': instance.offer_banners,
    };
