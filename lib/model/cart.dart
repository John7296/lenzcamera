import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/cart_details.dart';
import 'package:lenzcamera/model/product.dart';
part 'cart.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class CartResponse {
  @JsonKey(name: "cartList")
  List<Product>? cartItems;

  CartResponse();

  factory CartResponse.fromJson(Map<String, dynamic> json) =>
      _$CartResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CartResponseToJson(this);
}
