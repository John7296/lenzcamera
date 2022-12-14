import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/cart_details.dart';
import 'package:lenzcamera/model/order_detail.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/order_product_detail.dart';
part 'single_order_detail.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class SingleOrderDetail {
 

  @JsonKey(name: "OrderItemsDetails")
  List<OrderProductDetail>? OrderItemsDetails;

  SingleOrderDetail();

  factory SingleOrderDetail.fromJson(Map<String, dynamic> json) =>
      _$SingleOrderDetailFromJson(json);
  Map<String, dynamic> toJson() => _$SingleOrderDetailToJson(this);
}
