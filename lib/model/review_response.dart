
import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/details.dart';
import 'package:lenzcamera/model/order_detail.dart';
import 'package:lenzcamera/model/product_review.dart';
import 'package:lenzcamera/model/review_details.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse{

  @JsonKey(name: 'ReviewDetails')
  List<ReviewDetails>? reviewDetails;

  @JsonKey(name: 'Details')
   Details? details;

    @JsonKey(name: 'ProdRev')
  List<ProductReview>? prodRev;

  ReviewResponse();

   factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);

}