import 'package:lenzcamera/model/search_products.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_products_response.g.dart';

@JsonSerializable()
class SearchProductsResponse {
  List<SearchProducts>? products;

  SearchProductsResponse();

  factory SearchProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchProductsResponseToJson(this);
}
