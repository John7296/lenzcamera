import 'package:lenzcamera/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'related_products.g.dart';

@JsonSerializable()
class RelatedProducts {

  
  @JsonKey(name: 'RelatedList')
    List<Product>? relatedproducts;
   

  RelatedProducts();

  factory RelatedProducts.fromJson(Map<String, dynamic> json) =>
      _$RelatedProductsFromJson(json);
  Map<String, dynamic> toJson() => _$RelatedProductsToJson(this);
}
