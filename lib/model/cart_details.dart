import 'package:json_annotation/json_annotation.dart';

part 'cart_details.g.dart';

@JsonSerializable()
class CartDetails {
  @JsonKey(name: 'catId')
  int? catId;

  @JsonKey(name: 'cartId')
  int? catName;

  @JsonKey(name: 'cartItemsId')
  int? cartItemsId;

  @JsonKey(name: 'qty')
  double? qty;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'vendorId')
  int? vendorId;

  @JsonKey(name: 'vendorUrlKey')
  String? vendorUrlKey;

  @JsonKey(name: 'venderName')
  String? venderName;

  @JsonKey(name: 'pincode')
  String? pincode;

  @JsonKey(name: 'grandTotal')
  double? grandTotal;

  @JsonKey(name: 'subTotal')
  double? subTotal;

  @JsonKey(name: 'itemTotal')
  double? itemTotal;

  @JsonKey(name: 'cpAmount')
  double? cpAmount;

  @JsonKey(name: 'cpName')
  String? cpName;

  @JsonKey(name: 'totalDiscount')
  double? totalDiscount;

  @JsonKey(name: 'deliveryAmount')
  double? deliveryAmount;

  @JsonKey(name: 'cartStatus')
  bool? cartStatus;

  @JsonKey(name: 'IsAvailPincode')
  bool? IsAvailPincode;

  @JsonKey(name: 'productId')
  int? productId;

  @JsonKey(name: 'vendorid')
  int? vendorid;

  @JsonKey(name: 'prDate')
  String? prDate;

  @JsonKey(name: 'actDate')
  String? actDate;

  @JsonKey(name: 'prName')
  String? prName;

  @JsonKey(name: 'sku')
  String? sku;

  @JsonKey(name: 'unitPrice')
  double? unitPrice;

  @JsonKey(name: 'description')
  String? description;

  @JsonKey(name: 'shortDescription')
  String? shortDescription;

  @JsonKey(name: 'urlKey')
  String? urlKey;

  @JsonKey(name: 'metaTitle')
  String? metaTitle;

  @JsonKey(name: 'metaKeywords')
  String? metaKeywords;

  @JsonKey(name: 'metaDescription')
  String? metaDescription;

  @JsonKey(name: 'status')
  bool? status;




  CartDetails(
      {this.catName,
      this.imageUrl,
      this.prName,
      this.productId,
      this.urlKey,
      this.unitPrice,
      this.IsAvailPincode,
      this.actDate,
      this.cartItemsId,
      this.cartStatus,
      this.catId,
      this.cpAmount,
      this.cpName,
      this.deliveryAmount,
      this.description,
      this.grandTotal,
      this.itemTotal,
      this.metaDescription,
      this.metaKeywords,
      this.metaTitle,
      this.pincode,
      this.prDate,
      this.qty,
      this.shortDescription,
      this.sku,
      this.status,
      this.subTotal,
      this.totalDiscount,
      this.venderName,
      this.vendorId,
      this.vendorUrlKey,
      this.vendorid});



  factory CartDetails.fromJson(Map<String, dynamic> json) =>
      _$CartDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CartDetailsToJson(this);
}
