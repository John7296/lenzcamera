// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_banners.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainBanner _$MainBannerFromJson(Map<String, dynamic> json) => MainBanner()
  ..MainBanners = (json['MainBanners'] as List<dynamic>?)
      ?.map((e) => Banners.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$MainBannerToJson(MainBanner instance) =>
    <String, dynamic>{
      'MainBanners': instance.MainBanners,
    };
