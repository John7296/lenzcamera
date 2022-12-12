import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/cart_details.dart';
import 'package:lenzcamera/model/product_images.dart';

part 'order_product_detail.g.dart';

@JsonSerializable()
class OrderProductDetail {
  @JsonKey(name: 'prName')
  String? prName;

  @JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'orderId')
  int? orderId;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'productId')
  int? productId;

  @JsonKey(name: 'venderDetails')
  String? venderDetails;

  @JsonKey(name: 'qty')
  double? qty;

  @JsonKey(name: 'productPrice')
  double? productPrice;

  @JsonKey(name: 'itemTotal')
  double? itemTotal;

  @JsonKey(name: 'orderItemsId')
  int? orderItemsId;

  @JsonKey(name: 'status')
  String? status;

  OrderProductDetail(
      {this.imageUrl,
      this.itemTotal,
      this.latitude,
      this.longitude,
      this.orderId,
      this.orderItemsId,
      this.prName,
      this.productId,
      this.productPrice,
      this.qty,
      this.status,
      this.venderDetails});

  factory OrderProductDetail.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$OrderProductDetailToJson(this);
}
