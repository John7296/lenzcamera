import 'package:lenzcamera/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_products_response.g.dart';

@JsonSerializable()
class SearchProductsResponse {

  
  @JsonKey(name: 'List')
    List<Product>? products;
   

  SearchProductsResponse();

  factory SearchProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchProductsResponseToJson(this);
}
