import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/manager/data_manager.dart';


part 'category_list.g.dart';

@JsonSerializable()
class CategoryList{

   @JsonKey(name: "catId")
  int? catId;

  @JsonKey(name: "catName")
  String? catName;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "parentId")
  int? parentId;

  @JsonKey(name: "code")
  String? code;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "urlKey")
  String? UrlKey;

  @JsonKey(name: "metaTitle")
  String? metaTitle;

  @JsonKey(name: "metaKeywords")
  String? metaKeywords;

  @JsonKey(name: "metaDescription")
  String? metaDescription;

  @JsonKey(name: "delDate")
  String? delDate;

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: "catUrlKey")
  String? catUrlKey;

  @JsonKey(name: "imageUrl")
  String? imageUrl;

   @JsonKey(name: "position")
  String? position;

  @JsonKey(name: 'ShowInOfferZone')
  String? ShowInOfferZone;

  @JsonKey(name: "showInHomePage")
  String? showInHomePage;

  @JsonKey(name: "bannerImgUrl")
  String? bannerImgUrl;

  @JsonKey(name: "MobBannerImgUrl")
  String? MobBannerImgUrl;


 CategoryList(

  this.catId,
  this.catName,
  this.image,
  this.parentId,
  this.code,
  this.description,
  this.UrlKey,
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
  this.MobBannerImgUrl
 );

     factory  CategoryList.fromJson(Map<String, dynamic> json) =>
      _$CategoryListFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryListToJson(this);

}