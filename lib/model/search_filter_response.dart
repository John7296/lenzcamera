import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/attribute.dart';
import 'package:lenzcamera/model/category.dart';

part 'search_filter_response.g.dart';

@JsonSerializable()

class SearchFilterResponse{

 @JsonKey(name: "categoryList")
 List<Category>? categoryList;

  @JsonKey(name: "attributes")
 List<Attribute>? attributes;

 @JsonKey(name: "minPrize")
 double? minPrize;

 @JsonKey(name: "maxPrize")
 double? maxPrize;


SearchFilterResponse();

  factory SearchFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchFilterResponseToJson(this);

}