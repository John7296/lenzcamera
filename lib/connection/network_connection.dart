import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'network_connection.g.dart';

@RestApi(baseUrl: 'https://dev.lenzcamera.com/api/api/v2/')
abstract class NetworkConnection {


  factory NetworkConnection(Dio dio, {String? baseUrl}){
    
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
  @GET('category/TopCategory')
  Future<List<TopCategories>> getTopCategories();


    @FormUrlEncoded()
  @POST("/Account/Login")
  Future<BaseResponse<LoginCustomer>> userLogin(
    @Body() Map<String, dynamic> password,
    @Body() Map<String, dynamic> userName,
    @Header("Authorization") String token,
     @Path() String customerId,

  );


}
