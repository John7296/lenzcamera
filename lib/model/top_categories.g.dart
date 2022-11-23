// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_categories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopCategories _$TopCategoriesFromJson(Map<String, dynamic> json) =>
    TopCategories(
      categoryId: json['catId'] as int?,
      mobBannerImgUrl: json['MobBannerImgUrl'] as String?,
      productCount: json['ProductCount'] as String?,
      phowInOfferZone: json['ShowInOfferZone'] as bool?,
      bannerImgUrl: json['bannerImgUrl'] as String?,
      catName: json['catName'],
      catUrlKey: json['catUrlKey'] as String?,
      code: json['code'] as String?,
      delDate: json['delDate'] as String?,
      description: json['description'] as String?,
      image: json['image'],
      imageUrl: json['imageUrl'] as String?,
      metaDescription: json['metaDescription'] as String?,
      metaKeywords: json['metaKeywords'] as String?,
      metaTitle: json['metaTitle'] as String?,
      parentId: json['parentId'] as int?,
      urlKey: json['urlKey'] as String?,
    );

Map<String, dynamic> _$TopCategoriesToJson(TopCategories instance) =>
    <String, dynamic>{
      'catId': instance.categoryId,
      'MobBannerImgUrl': instance.mobBannerImgUrl,
      'catName': instance.catName,
      'image': instance.image,
      'parentId': instance.parentId,
      'code': instance.code,
      'description': instance.description,
      'ProductCount': instance.productCount,
      'urlKey': instance.urlKey,
      'metaTitle': instance.metaTitle,
      'metaKeywords': instance.metaKeywords,
      'bannerImgUrl': instance.bannerImgUrl,
      'ShowInOfferZone': instance.phowInOfferZone,
      'metaDescription': instance.metaDescription,
      'catUrlKey': instance.catUrlKey,
      'imageUrl': instance.imageUrl,
      'delDate': instance.delDate,
    };
