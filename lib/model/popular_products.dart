import 'package:json_annotation/json_annotation.dart';

part 'popular_products.g.dart';

@JsonSerializable()
class PopularProducts {
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

  @JsonKey(name: 'venderDetails')
  String? venderDetails;

  @JsonKey(name: 'vendorUrlKey')
  String? vendorUrlKey;

  @JsonKey(name: 'variationJson')
  int? variationJson;

  @JsonKey(name: 'catUrlKey')
  String? catUrlKey;

  @JsonKey(name: 'IsWishlisted')
  bool? IsWishlisted;

  @JsonKey(name: 'catStatus')
  bool? catStatus;

  @JsonKey(name: 'IsCarted')
  bool? IsCarted;

  @JsonKey(name: 'IsAvailPincode')
  bool? IsAvailPincode;

  @JsonKey(name: 'IsReviewCount')
  int? IsReviewCount;

  @JsonKey(name: 'Reviewstatus')
  int? Reviewstatus;

  @JsonKey(name: 'IsReviewAvgrating')
  double? IsReviewAvgrating;

  @JsonKey(name: 'productId')
  int? productId;

  @JsonKey(name: 'vendorid')
  int? vendorid;

  @JsonKey(name: 'prDate')
  String? prDate;

  @JsonKey(name: 'actDate')
  String? actDate;

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

  @JsonKey(name: 'qoh')
  double? qoh;

  @JsonKey(name: 'rank')
  int? rank;

  @JsonKey(name: 'availableFrom')
  String? availableFrom;

  @JsonKey(name: 'availableTo')
  String? availableTo;

  @JsonKey(name: 'suspendedDate')
  String? suspendedDate;

  @JsonKey(name: 'newDate')
  String? newDate;

  @JsonKey(name: 'delDate')
  String? delDate;

  @JsonKey(name: 'maxQtyInOrders')
  double? maxQtyInOrders;

  @JsonKey(name: 'soldQty')
  double? casoldQtytId;

  @JsonKey(name: 'stockAvailability')
  String? stockAvailability;

  @JsonKey(name: 'backOrders')
  bool? backOrders;

  @JsonKey(name: 'rol')
  double? rol;

  @JsonKey(name: 'roq')
  double? roq;

  @JsonKey(name: 'specialPrice')
  int? specialPrice;

  @JsonKey(name: 'attributeSetId')
  int? attributeSetId;

  @JsonKey(name: 'pincodeSetId')
  int? pincodeSetId;

  @JsonKey(name: 'prWeight')
  int? prWeight;

  @JsonKey(name: 'taxClassId')
  int? taxClassId;

  @JsonKey(name: 'cessAmount')
  int? cessAmount;

  @JsonKey(name: 'dealFrom')
  String? dealFrom;

  @JsonKey(name: 'dealTo')
  String? dealTo;

  @JsonKey(name: 'featuredImage')
  String? featuredImage;

  @JsonKey(name: 'avgRating')
  int? avgRating;

  @JsonKey(name: 'reviewCount')
  String? reviewCount;

  @JsonKey(name: 'minQtyInOrders')
  int? minQtyInOrders;

  @JsonKey(name: 'comboProducts')
  String? comboProducts;

  @JsonKey(name: 'productType')
  String? productType;

  @JsonKey(name: 'minOrderQty')
  int? minOrderQty;

  @JsonKey(name: 'bvValue')
  int? bvValue;

  PopularProducts(
      {this.catName,
      this.imageUrl,
      this.parentId,
      this.catId,
      this.prName,
      this.venderName,
      this.IsAvailPincode,
      this.IsCarted,
      this.IsReviewAvgrating,
      this.IsReviewCount,
      this.IsWishlisted,
      this.Reviewstatus,
      this.actDate,
      this.attributeSetId,
      this.availableFrom,
      this.availableTo,
      this.avgRating,
      this.backOrders,
      this.bvValue,
      this.casoldQtytId,
      this.catStatus,
      this.catUrlKey,
      this.cessAmount,
      this.comboProducts,
      this.dealFrom,
      this.dealTo,
      this.delDate,
      this.description,
      this.featuredImage,
      this.maxQtyInOrders,
      this.metaDescription,
      this.metaKeywords,
      this.metaTitle,
      this.minOrderQty,
      this.minQtyInOrders,
      this.newDate,
      this.pincodeSetId,
      this.prDate,
      this.prWeight,
      this.productId,
      this.productType,
      this.qoh,
      this.rank,
      this.reviewCount,
      this.rol,
      this.roq,
      this.shortDescription,
      this.sku,
      this.specialPrice,
      this.status,
      this.stockAvailability,
      this.suspendedDate,
      this.taxClassId,
      this.unitPrice,
      this.urlKey,
      this.variationJson,
      this.venderDetails,
      this.vendorUrlKey,
      this.vendorid});

  factory PopularProducts.fromJson(Map<String, dynamic> json) =>
      _$PopularProductsFromJson(json);
  Map<String, dynamic> toJson() => _$PopularProductsToJson(this);
}
