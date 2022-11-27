import 'package:json_annotation/json_annotation.dart';

part 'featured_products.g.dart';

@JsonSerializable()
class FeaturedProducts {
  @JsonKey(name: 'venderName')
  String? venderName;

  @JsonKey(name: 'catName')
  String? catName;

  @JsonKey(name: 'catId')
  int? catId;

  @JsonKey(name: 'prName')
  String? prName;

  @JsonKey(name: 'parentId')
  int? parentId;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;



  FeaturedProducts(
      {
      this.catName,
      this.imageUrl,
      this.parentId,
      this.catId,
      this.prName,
      this.venderName
      });

  factory FeaturedProducts.fromJson(Map<String, dynamic> json) =>
      _$FeaturedProductsFromJson(json);
  Map<String, dynamic> toJson() => _$FeaturedProductsToJson(this);
}
