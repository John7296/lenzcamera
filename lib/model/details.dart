import 'package:json_annotation/json_annotation.dart';

part 'details.g.dart';

@JsonSerializable()

class Details{

    @JsonKey(name: 'cusId')
  int? cusId;

  @JsonKey(name: 'reviewId')
  int? reviewId;

    @JsonKey(name: 'productId')
  int? productId;

    @JsonKey(name: 'dateOfReview')
  String? dateOfReview;

    @JsonKey(name: 'reviewTitle')
  String? reviewTitle;

    @JsonKey(name: 'reviewDetails')
  String? reviewDetails;


  @JsonKey(name: 'rating')
  int? rating;

    @JsonKey(name: 'reviewerName')
  String? reviewerName;

    @JsonKey(name: 'reviewerEmail')
  String? reviewerEmail;

    @JsonKey(name: 'status')
  String? status;

    @JsonKey(name: 'delDate')
  String? delDate;

     @JsonKey(name: 'Product')
  String? Product;


Details({

this.cusId,
this.reviewId,
this.productId,
this.dateOfReview,
this.reviewTitle,
this.reviewDetails,
this.rating,
this.reviewerName,
this.reviewerEmail,
this.status,
this.delDate,
this.Product

});

 factory Details.fromJson(Map<String, dynamic> json) =>
      _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);

}