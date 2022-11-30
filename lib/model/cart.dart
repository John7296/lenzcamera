import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/cart_details.dart';
part 'cart.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class Cart {
  @JsonKey(name: "cartList")
  List<CartDetails>? cartItems;

  Cart();

  factory Cart.fromJson(Map<String, dynamic> json) =>
      _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
