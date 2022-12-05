
import 'package:json_annotation/json_annotation.dart';

part 'attribute.g.dart';

@JsonSerializable()
class Attribute{

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
  final int? productCount;

    @JsonKey(name: "imageUrl")
  final String? imageUrl;

   @JsonKey(name: "imageIcon")
  final String? imageIcon;

   @JsonKey(name: "ShowInHome")
  final bool? showInHome;

 @JsonKey(name: "brandDetailId")
  final int? brandDetailId;



  Attribute({

    this.attrValue,
    this.attrName,
    this.brandName,
    this.attrId,
    this.attrValueId,
    this.productCount,
    this.imageUrl,
    this.imageIcon,
    this.showInHome,
    this.brandDetailId
  });

   factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
  Map<String, dynamic> toJson() => _$AttributeToJson(this);

}