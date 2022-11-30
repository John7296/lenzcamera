import 'package:json_annotation/json_annotation.dart';

part 'filter_products.g.dart';

@JsonSerializable()
class FilterProducts{
  @JsonKey(name: "catId")
  final int? catId;

   @JsonKey(name: "catName")
  final String? catName;

   @JsonKey(name: "image")
  final String? image;

   @JsonKey(name: "parentId")
  final int? parentId;

   @JsonKey(name: "code")
  final int? code;

   @JsonKey(name: "description")
  final String? description;

   @JsonKey(name: "urlKey")
  final String? urlKey;

   @JsonKey(name: "metaTitle")
  final String? metaTitle;

   @JsonKey(name: "metaKeywords")
  final String? metaKeywords;

     @JsonKey(name: "metaDescription")
  final String? metaDescription;

     @JsonKey(name: "delDate")
  final String? delDate;

     @JsonKey(name: "status")
  final String? status;

     @JsonKey(name: "catUrlKey")
  final String? catUrlKey;

    @JsonKey(name: "imageUrl")
  final String? imageUrl;

    @JsonKey(name: "position")
  final String? position;

    @JsonKey(name: "ShowInOfferZone")
  final String? ShowInOfferZone;

    @JsonKey(name: "showInHomePage")
  final String? showInHomePage;

  @JsonKey(name: "bannerImgUrl")
  final String? bannerImgUrl;

   @JsonKey(name: "MobbannerImgUrl")
  final String? MobbannerImgUrl;

 
    @JsonKey(name: "minPrize")
  final String? minPrize;

    @JsonKey(name: "maxPrize")
  final String? maxPrize;


    FilterProducts({
      this.catId,
      this.catName,
      this.image,
      this.parentId,
      this.code,
      this.description,
      this.urlKey,
      this.metaTitle,
      this.metaKeywords,
      this.metaDescription,
      this.delDate,
      this.status,
      this.catUrlKey,
      this.imageUrl,
      this.position,
      this.ShowInOfferZone,
      this.showInHomePage,
      this.bannerImgUrl,
      this.MobbannerImgUrl,
      this.minPrize,
      this.maxPrize
});


   factory FilterProducts.fromJson(Map<String, dynamic> json) =>
      _$FilterProductsFromJson(json);
  Map<String, dynamic> toJson() => _$FilterProductsToJson(this);
  
}