import 'package:lenzcamera/model/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_images.g.dart';

@JsonSerializable()
class ProductImages{

@JsonKey(name: 'imageUrl')
  String? imageUrl;

  @JsonKey(name: 'position')
  int? position;

  @JsonKey(name: 'imgType')
  String? imgType;

 ProductImages({

  this.imageUrl,
  this.position,
  this.imgType
 });

 factory ProductImages.fromJson(Map<String, dynamic> json) =>
      _$ProductImagesFromJson(json);
  Map<String, dynamic> toJson() => _$ProductImagesToJson(this);

}