import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/featured_products.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
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
  @POST("/Account/Login")
  Future<BaseResponse<LoginCustomer>> userLogin(
   @Body() Map<String, dynamic> map);


     @FormUrlEncoded()
  @GET("/Customer/ForgotPassword?email=sreejith@intertoons.com&mobileNumber=")
  Future<BaseResponse> forgotPasswordOTPSend(
    @Body() Map<String, dynamic> map);


     @FormUrlEncoded()
  @GET("/Customer/VerifyOTP?OTP=34727&OtpUrlKey=O16G665VHN")
  Future<BaseResponse> verifyForgotPasswordOtp(
    @Body() Map<String, dynamic> map);
    

      @FormUrlEncoded()
  @GET("/Customer/ResetPassword?OtpUrlKey=8KUPP8MS4Y&password=123456")
  Future<BaseResponse> resetPassword(
    @Body() Map<String, dynamic> map);
     
    @FormUrlEncoded()
    @GET('CompanyPolicy')
    Future<BaseResponse<List<CompanyPolicy>>> getCompanyPolicy();

    @FormUrlEncoded()
    @POST("Customer/Register")
    Future<BaseResponse<NewRegister>> newRegister(
      @Body()Map<String, dynamic>map
    );

    @FormUrlEncoded()
    @POST("NewAddress")
    Future<BaseResponse> addAddress(@Body() Map<String, dynamic> map);

    @FormUrlEncoded()
    @GET("Customer/RegisterVerifyOTP")
    Future<BaseResponse>verifyOtp(
      @Query("OTP")  int otp,
      @Query("OtpUrlKey") String otpurlkey,
    );

      @FormUrlEncoded()
  @GET('FeaturedProduct')
  Future<BaseResponse<List<FeaturedProducts>>> featuredProducts(
    @Query("custId") int custId,
    @Query("guestId") int gustId,
  );

  //     @FormUrlEncoded()
  // @GET('Products/HomeProducts')
  // Future<BaseResponse<List<FeaturedProducts>>> homeDetails(
  //   @Query("custId") int custId,
  //   @Query("guestId") int gustId,
  // );

}
