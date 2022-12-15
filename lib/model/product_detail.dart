import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_images.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail{

      @JsonKey(name: "ProdDetails")
 List<Product>? productDetails;

  @JsonKey(name: 'RelatedList')
    List<Product>? relatedList;

      @JsonKey(name: "ProdImages")
 List<ProductImages>? productImages;

    ProductDetail();

     factory  ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}