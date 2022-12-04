import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/attributes.dart';
import 'package:lenzcamera/model/category_list.dart';

part 'search_filter_response.g.dart';

@JsonSerializable()

class SearchFilterResponse{

 @JsonKey(name: "categoryList")
 List<CategoryList>? categoryList;

  @JsonKey(name: "attributes")
 List<Attributes>? attributes;


SearchFilterResponse();

  factory SearchFilterResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchFilterResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchFilterResponseToJson(this);

}