
import 'package:json_annotation/json_annotation.dart';
import 'package:lenzcamera/model/product_review.dart';
import 'package:lenzcamera/model/review_details.dart';

part 'review_response.g.dart';

@JsonSerializable()
class ReviewResponse{


    @JsonKey(name: 'OrderDetails')
  String? OrderDetails;

  @JsonKey(name: 'ReviewDetails')
  List<ReviewDetails>? reviewDetails;

  @JsonKey(name: 'Details')
  ReviewDetails? details;

    @JsonKey(name: 'ProdRev')
  List<ProductReview>? prodRev;

  ReviewResponse({
    this.OrderDetails,
  });

   factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewResponseToJson(this);

}