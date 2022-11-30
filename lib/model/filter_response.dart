
import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/attributes.dart';
import 'package:lenzcamera/model/filter_products.dart';

part 'filter_response.g.dart';

@JsonSerializable()
class FilterResponse{

    @JsonKey(name: 'categoryList"')
    List<FilterProducts>? filterproducts;

      @JsonKey(name: 'attributes')
    List<Attributes>? filterattributes;

    FilterResponse();


    factory FilterResponse.fromJson(Map<String, dynamic> json) =>
      _$FilterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FilterResponseToJson(this);

}