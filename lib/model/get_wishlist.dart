import 'package:json_annotation/json_annotation.dart';

part 'get_wishlist.g.dart';

@JsonSerializable()
class WishList {
  @JsonKey(name: 'prName')
  String? prName;

  @JsonKey(name: 'catName')
  String? catName;

  @JsonKey(name: 'custId')
  int? custId;

  @JsonKey(name: 'wishlistId')
  int? wishlistId;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'productId')
  int? productId;

  @JsonKey(name: 'urlKey')
  String? urlKey;

@JsonKey(name: 'unitPrice')
  double? unitPrice;
  

  WishList({
    this.catName,
    this.imageUrl,
    this.custId,
    this.prName,
    this.productId,
    this.urlKey,
    this.wishlistId,
    this.unitPrice,
  });

  factory WishList.fromJson(Map<String, dynamic> json) =>
      _$WishListFromJson(json);
  Map<String, dynamic> toJson() => _$WishListToJson(this);
}
