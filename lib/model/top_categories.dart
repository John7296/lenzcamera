import 'package:json_annotation/json_annotation.dart';

part 'top_categories.g.dart';

@JsonSerializable()
class TopCategories {
  @JsonKey(name: 'catId')
  int? categoryId;

  @JsonKey(name: 'MobBannerImgUrl')
  String? mobBannerImgUrl;

  @JsonKey(name: 'catName')
  dynamic catName;

  @JsonKey(name: 'image')
  dynamic image;

  @JsonKey(name: 'parentId')
  int? parentId;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'ProductCount')
  String? productCount;

  @JsonKey(name: 'urlKey')
  String? urlKey;

  @JsonKey(name: 'metaTitle')
  String? metaTitle;

  @JsonKey(name: 'metaKeywords')
  String? metaKeywords;

  @JsonKey(name: 'bannerImgUrl')
  String? bannerImgUrl;

  @JsonKey(name: 'ShowInOfferZone')
  bool? phowInOfferZone;

  @JsonKey(name: 'metaDescription')
  String? metaDescription;

  @JsonKey(name: 'catUrlKey')
  String? catUrlKey;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'delDate')
  String? delDate;

  TopCategories(
      {this.categoryId,
      this.mobBannerImgUrl,
      this.productCount,
      this.phowInOfferZone,
      this.bannerImgUrl,
      this.catName,
      this.catUrlKey,
      this.code,
      this.delDate,
      this.description,
      this.image,
      this.imageUrl,
      this.metaDescription,
      this.metaKeywords,
      this.metaTitle,
      this.parentId,
      this.urlKey});

  factory TopCategories.fromJson(Map<String, dynamic> json) =>
      _$TopCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$TopCategoriesToJson(this);
}
