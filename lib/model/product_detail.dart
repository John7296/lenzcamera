import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/manager/data_manager.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail_response.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail{


  @JsonKey(name: 'RelatedList')
    List<Product>? products;

    ProductDetail();

     factory  ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}