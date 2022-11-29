import 'package:json_annotation/json_annotation.dart';

part 'search_products.g.dart';

@JsonSerializable()
class SearchProducts {


  @JsonKey(name: 'rNum')
   int? rNum;

  @JsonKey(name: 'catName')
   String? catName;

  
  @JsonKey(name: 'emailId')
    String? emailId;

  
  @JsonKey(name: 'imageUrl')
   String? imageUrl;

   @JsonKey(name: 'vendorsName')
   String? vendorsName;

   @JsonKey(name: 'roleId')
   int? roleId;

   @JsonKey(name: 'rc')
   int? rc;


 @JsonKey(name: 'productId')
 int? productId;

  @JsonKey(name: 'prName')
  String? prName;

    @JsonKey(name: 'unitPrice')
  double? unitPrice;


  SearchProducts({
          this.rNum,
          this.catName,
          this.emailId,
          this.imageUrl,
          this.vendorsName,
          this.roleId,
          this.productId,
          this.prName,
          this.unitPrice,
          this.rc


  });

  factory SearchProducts.fromJson(Map<String, dynamic> json) =>
      _$SearchProductsFromJson(json);
  Map<String, dynamic> toJson() => _$SearchProductsToJson(this);
}
