import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/main_banners.dart';
import 'package:lenzcamera/model/order_detail.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/related_products.dart';
import 'package:lenzcamera/model/search_filter_response.dart';

import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/model/single_order_detail.dart';
import 'package:lenzcamera/model/state_list.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/utils/constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_connection.g.dart';

@RestApi(baseUrl: 'https://dev.lenzcamera.com/api/api/v2/')
abstract class NetworkConnection {
  factory NetworkConnection(Dio dio, {String? baseUrl}) {
    if (kDedebug) {
      dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
    }
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
  Future<BaseResponse> forgotPasswordOTPSend(
    @Query("email") String emailId,
    @Query("mobileNumber") String mobileNumber,
  );

  @FormUrlEncoded()
  @GET("Customer/VerifyOTP")
  Future<BaseResponse> verifyForgotPasswordOTP(
    @Query("OTP") String otp,
    @Query("OtpUrlKey") String otpurlkey,
  );

  @FormUrlEncoded()
  @GET("Customer/ResetPassword")
  Future<BaseResponse> resetPassword(
    @Query("OtpUrlKey") String otp,
    @Query("password") String password,
  );

  @FormUrlEncoded()
  @POST("customer/ChangePassword")
  Future<BaseResponse<LoginCustomer>> changePassword(
      @Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @POST("Product/Search")
  Future<BaseResponse<SearchProductsResponse>> searchProducts(
    @Body() Map<String, dynamic> map,
  );

  @FormUrlEncoded()
  @POST("/Support")
  Future<BaseResponse> supportMessageSend(
    @Body() Map<String, dynamic> map,
  );

  @FormUrlEncoded()
  @GET("/ProductDetails")
  Future<BaseResponse<Product>> getSingleProductDetails(
    
      @Query("custId") int userId,
      @Query("guestId") int guestId,
      @Query("urlKey") String urlKey,
      @Query("pincode") int pincode);

  @FormUrlEncoded()
  @GET("/CustomerDetails")
  Future<BaseResponse<LoginCustomer>> customerDetails(
    @Query("custId") int userId,
  );

  @FormUrlEncoded()
  @POST("Product/SearchFilter")
  Future<BaseResponse<SearchFilterResponse>> searchFilter(
    @Body() Map<String, dynamic> map,
  );

  @FormUrlEncoded()
  @POST("Product/ProductReviewSubmit")
  Future<BaseResponse> addReview(
    @Body() Map<String, dynamic> map,
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
  @GET('Order/CusAddressList')
  Future<BaseResponse<List<AddressList>>> getAddressList(
    @Query("cusId") int cusId,
  );

  @FormUrlEncoded()
  @POST("Customer/UpdateAddress")
  Future<BaseResponse> updateAddress(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET("Customer/DelAddress/{cusAddress_id}")
  Future<BaseResponse> deleteAddress(
    @Path() String cusAddress_id,
  );

  @FormUrlEncoded()
  @GET("StateList")
  Future<BaseResponse<List<StateList>>> stateListAddress(
    @Query("CountryId") int CountryId,
  );

  @FormUrlEncoded()
  @GET("CityList")
  Future<BaseResponse<List<CityList>>> cityListAddress(
    @Query("stateId") int stateId,
  );

  @FormUrlEncoded()
  @GET("Customer/RegisterVerifyOTP")
  Future<BaseResponse> verifyOtp(
    @Query("OTP") int otp,
    @Query("OtpUrlKey") String otpurlkey,
  );

  @FormUrlEncoded()
  @GET('FeaturedProduct')
  Future<BaseResponse<List<Product>>> featuredProducts(
    @Query("custId") int userId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('PopularProduct')
  Future<BaseResponse<List<Product>>> popularProducts(
    @Query("custId") int userId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('RecentProducts')
  Future<BaseResponse<List<Product>>> recentProducts(
    @Query("custId") int userId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @GET('Products/HomeProducts')
  Future<BaseResponse<MainBanner>> getBanner(
    @Query("custId") int userId,
    @Query("guestId") int guestId,
    @Query("pincode") int pincode,
  );

  @FormUrlEncoded()
  @GET('Order/WishLists')
  Future<BaseResponse<List<Product>>> getWishList(
    @Query("custId") int userId,
    @Query("guestId") int gustId,
  );

  @FormUrlEncoded()
  @POST('Order/InsertWishLists')
  Future<BaseResponse> addToWishlist(@Body() Map<String, dynamic> map);

  @POST('Order/InsertWishListsDel')
  Future<BaseResponse> removeFromWishlist(
    @Query("custId") int userId,
    @Query("guestId") int gustId,
    @Query("urlKey") String urlKey,
  );

  @FormUrlEncoded()
  @GET('CustomerDetails')
  Future<BaseResponse<Profile>> getProfile(
    @Query("custId") int userId,
  );

  @FormUrlEncoded()
  @POST("ProfileUpdate")
  Future<BaseResponse> updateProfile(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET('Order/CartList')
  Future<BaseResponse<CartResponse>> getCart(
    // @Body() Map<String, dynamic> map,
    @Query("cusId") int userId,
    @Query("guestId") int guestId,
    @Query("pincode") int pincode,
  );

  @FormUrlEncoded()
  @POST('Order/AddToCart')
  Future<BaseResponse> addToCart(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @POST('Order/RemoveCartItemByUrlkey')
  Future<BaseResponse> removeFromCart(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @POST('Order/CartItemSubQtyByUrlKey')
  Future<BaseResponse> subCartQty(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET("Order/CartItemAddQty")
  Future<BaseResponse> addCartQty(
    @Query("cartItemId") int cartItemId,
  );

  @FormUrlEncoded()
  @GET('Order/CustOrderList')
  Future<BaseResponse<List<OrderList>>> getOrderList(
    @Query("cusId") int userId,
    // @Query("year") int year,
    // @Query("addressid") int addressid,
    // @Query("guestId") int guestId,
  );

  // @FormUrlEncoded()
  // @GET("Order/CustOrderItemList")
  // Future<BaseResponse<SingleOrderDetail>> orderItemDetails(
  //   @Query("orderId") int orderId,
  // );

  @FormUrlEncoded()
  @GET("Order/CustOrderItemList")
  Future<BaseResponse<SingleOrderDetail>> orderDetails(
    @Query("orderId") int orderId,
  );

  @FormUrlEncoded()
  @POST('Order')
  Future<BaseResponse> placeOrder(@Body() Map<String, dynamic> map);

  @FormUrlEncoded()
  @GET("Order/CancelOrderItem")
  Future<BaseResponse> cancelOrder(
    @Query("orderId") int orderId,
    @Query("custId") int custId,
  );
}
