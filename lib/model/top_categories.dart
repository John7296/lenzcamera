import 'package:json_annotation/json_annotation.dart';

part 'top_categories.g.dart';

@JsonSerializable()
class TopCategories {
  @JsonKey(name: 'catId')
  String? categoryId;

  @JsonKey(name: 'MobBannerImgUrl')
  String? MobBannerImgUrl;

  @JsonKey(name: 'catName')
  String? catName;

  @JsonKey(name: 'image')
  String? image;

  @JsonKey(name: 'parentId')
  String? parentId;

  @JsonKey(name: 'code')
  String? code;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'ProductCount')
  String? ProductCount;

  @JsonKey(name: 'urlKey')
  String? urlKey;

  @JsonKey(name: 'metaTitle')
  String? metaTitle;

  @JsonKey(name: 'metaKeywords')
  String? metaKeywords;

  @JsonKey(name: 'bannerImgUrl')
  String? bannerImgUrl;

  @JsonKey(name: 'ShowInOfferZone')
  String? ShowInOfferZone;

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
      this.MobBannerImgUrl,
      this.ProductCount,
      this.ShowInOfferZone,
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
