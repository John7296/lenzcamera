import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/featured_products.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/filter_response.dart';
import 'package:lenzcamera/model/get_wishlist.dart';
import 'package:lenzcamera/model/home_details.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/model/popular_products.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/recent_products.dart';
import 'package:lenzcamera/model/search_products.dart';
import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_connection.g.dart';

@RestApi(baseUrl: 'https://dev.lenzcamera.com/api/api/v2/')
abstract class NetworkConnection {
  factory NetworkConnection(Dio dio, {String? baseUrl}) {
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    return _NetworkConnection(dio);
  }
  @FormUrlEncoded()
  @GET('category/TopCategory')
  Future<BaseResponse<List<TopCategories>>> getTopCategories();

  @FormUrlEncoded()
  @POST("Account/Login")
  Future<BaseResponse<LoginCustomer>> userLogin(
      @Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET("Customer/ForgotPassword")
  Future<BaseResponse>forgotPasswordOTPSend(
     @Query("email") String emailId,
      @Query("mobileNumber") String mobileNumber,
    );

    @FormUrlEncoded()
  @GET("Customer/VerifyOTP")
  Future<BaseResponse>verifyForgotPasswordOTP(
     @Query("OTP") String otp,
      @Query("OtpUrlKey") String otpurlkey,
    );

  @FormUrlEncoded()
  @GET("Customer/ResetPassword")
  Future<BaseResponse> resetPassword(
    @Body() Map<String, dynamic> map,
  );

    @FormUrlEncoded()
  @POST("Product/Search")
  Future<BaseResponse<SearchProductsResponse>>searchProducts(
     @Body() Map<String, dynamic> map,
  );

   @FormUrlEncoded()
  @POST("Product/SearchFilter")
  Future<BaseResponse<FilterResponse>>searchFilter(
     @Body() Map<String, dynamic> map,
  );


   @FormUrlEncoded()
  @GET("/Support")
  Future<BaseResponse> supportMessageSend(
    @Body() Map<String, dynamic> map,
  );

   @FormUrlEncoded()
  @GET("/CustomerDetails")
  Future<BaseResponse<Customer>> customerDetails(
  );

  @FormUrlEncoded()
  @GET('CompanyPolicy')
  Future<BaseResponse<List<CompanyPolicy>>> getCompanyPolicy();

  @FormUrlEncoded()
  @POST("Customer/Register")
  Future<BaseResponse<NewRegister>> newRegister(
      @Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @POST("NewAddress")
  Future<BaseResponse> addAddress(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET("Customer/RegisterVerifyOTP")
  Future<BaseResponse> verifyOtp(
    @Query("OTP") int otp,
    @Query("OtpUrlKey") String otpurlkey,
  );

  @FormUrlEncoded()
  @GET('FeaturedProduct')
  Future<BaseResponse<List<FeaturedProducts>>> featuredProducts(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('PopularProduct')
  Future<BaseResponse<List<PopularProducts>>> popularProducts(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('RecentProducts')
  Future<BaseResponse<List<RecentProducts>>> recentProducts(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('Products/HomeProducts')
  Future<BaseResponse<List<HomeDetails>>> homeDetails(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('Order/WishLists')
  Future<BaseResponse<List<WishList>>> getWishList(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @POST('Order/InsertWishLists')
  Future<BaseResponse> addToWishlist(@Body() Map<String, dynamic> map);

  @POST('Order/InsertWishListsDel')
  Future<BaseResponse> removeFromWishlist(
    @Query("custId") int custId,
    @Query("guestId") String gustId,
    @Query("urlKey") String urlKey,
  );

  @FormUrlEncoded()
  @GET('CustomerDetails')
  Future<BaseResponse<Profile>> getProfile(
    @Query("custId") int custId,
  );

  @FormUrlEncoded()
  @POST("ProfileUpdate")
  Future<BaseResponse> updateProfile(
    @Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET('Order/CartList')
  Future<BaseResponse<Cart>> getCart(
    // @Body() Map<String, dynamic> map,
    @Query("custId") int custId,
    @Query("guestId") String gustId,
    @Query("pincode") int pincode,
  );

  @FormUrlEncoded()
  @POST('Order/AddToCart')
  Future<BaseResponse> addToCart(@Body() Map<String, dynamic> map);

    @FormUrlEncoded()
  @POST('Order/RemoveCartItemByUrlkey')
  Future<BaseResponse> removeFromCart(@Body() Map<String, dynamic> map);
}
