
import 'package:json_annotation/json_annotation.dart';

part 'attributes.g.dart';

@JsonSerializable()
class Attributes{

    @JsonKey(name: "attrValue")
  final String? attrValue;

    @JsonKey(name: "attrName")
  final String? attrName;

    @JsonKey(name: "brandName")
  final String? brandName;

    @JsonKey(name: "attrId")
  final int? attrId;

    @JsonKey(name: "attrValueId")
  final int? attrValueId;

    @JsonKey(name: "ProductCount")
  final int? ProductCount;

    @JsonKey(name: "imageUrl")
  final String? imageUrl;

   @JsonKey(name: "imageIcon")
  final String? imageIcon;


  Attributes({

    this.attrValue,
    this.attrName,
    this.brandName,
    this.attrId,
    this.attrValueId,
    this.ProductCount,
    this.imageUrl,
    this.imageIcon
  });

   factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);
  Map<String, dynamic> toJson() => _$AttributesToJson(this);

}