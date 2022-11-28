import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lenzcamera/connection/network_connection.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/featured_products.dart';
import 'package:lenzcamera/model/get_wishlist.dart';
import 'package:lenzcamera/model/home_details.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/model/popular_products.dart';
import 'package:lenzcamera/model/recent_products.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/screens/featured_products_screen.dart';
import 'package:lenzcamera/utils/sessions_manager.dart';

class NetworkManager {
  static final NetworkManager _singleton = NetworkManager._internal();

  factory NetworkManager() {
    return _singleton;
  }

  static NetworkManager get shared => _singleton;

  NetworkManager._internal();

  Dio? dio;
  late NetworkConnection networkConnection;
  late String userKey;
  late String otp;
  late String otpurlkey;

  init() {
    dio = Dio();
    networkConnection = NetworkConnection(dio!);
  }

  void refreshTokens() {
    SessionsManager.getUserToken().then((token) {
      token = (token ?? "");
      userKey = token.isEmpty ? "" : "Bearer $token";
    });
  }

  Future<BaseResponse<List<TopCategories>>> getTopCategories() {
    return call(networkConnection.getTopCategories());
  }

  Future<BaseResponse<LoginCustomer>> userLogin(Map<String, dynamic> map) {
    return call(networkConnection.userLogin(map));
  }

  Future<BaseResponse<List<CompanyPolicy>>> getCompanyPolicy() {
    return call(networkConnection.getCompanyPolicy());
  }

  Future<BaseResponse<NewRegister>> newRegister(Map<String, dynamic> map) {
    return call(networkConnection.newRegister(map));
  }

  Future<BaseResponse> addAddress(Map<String, dynamic> map) {
    return call(networkConnection.addAddress(map));
  }

  Future<BaseResponse> forgotPasswordOTPSend(Map<String, dynamic> map) {
    return call(networkConnection.forgotPasswordOTPSend(map));
  }

  Future<BaseResponse> verifyForgotPasswordOtp(Map<String, dynamic> map) {
    return call(networkConnection.verifyForgotPasswordOtp(map));
  }

  Future<BaseResponse> restPassword(Map<String, dynamic> map) {
    return call(networkConnection.resetPassword(map));
  }

  Future<BaseResponse> verifyOtp(Map<String, dynamic> map) {
    return call(
        networkConnection.verifyOtp(int.parse(map['OTP']), map['OtpUrlKey']));
  }

  Future<BaseResponse<List<FeaturedProducts>>> featuredProducts() {
    return call(networkConnection.featuredProducts(int.parse("386"), 0));
  }

  Future<BaseResponse<List<PopularProducts>>> popularProducts() {
    return call(networkConnection.popularProducts(int.parse("386"), 0));
  }

  Future<BaseResponse<List<RecentProducts>>> recentProducts() {
    return call(networkConnection.recentProducts(int.parse("386"), 0));
  }

  Future<BaseResponse<List<HomeDetails>>> homeDetails() {
    return call(networkConnection.homeDetails(int.parse("386"), 0));
  }

  Future<BaseResponse<List<WishList>>> getWishList() {
    return call(networkConnection.getWishList(int.parse("386"), 0));
  }

  Future<BaseResponse> addToWishlist(Map<String, dynamic> map) {
    return call(networkConnection.addToWishlist(map));
  }

  Future<T> call<T>(Future<T> call) async {
    T response;

    try {
      response = await call;
    } catch (error) {
      if (error is DioError) {
        String _errorMessage = "";

        switch (error.type) {
          case DioErrorType.cancel:
            _errorMessage = "Request was cancelled";
            break;
          case DioErrorType.connectTimeout:
            _errorMessage = "Connection timeout";
            break;
          case DioErrorType.other:
            if (error.message.contains('Failed host lookup')) {
              _errorMessage = "Please check your internet connection";
            } else {
              _errorMessage = "Something went wrong ${error.message}";
            }
            break;
          case DioErrorType.receiveTimeout:
            _errorMessage = "Receive timeout in connection";
            break;
          case DioErrorType.response:
            if (error.response?.statusCode == 401) {
              _errorMessage = "Session timeout";
              // DataManager.shared.onTokenExpired!();
              throw (_errorMessage);
            }

            if (error.response?.statusCode == 500) {
              try {
                if (error.response!.data["data"] != null) {
                  if (error.response!.data["data"]["go_to_cart"] != null) {
                    if (error.response!.data["data"]["go_to_cart"]) {
                      // DataManager.shared.onGotoCartFired!();
                    }
                  }
                }
              } catch (e) {}
            }

            _errorMessage = "${error.response!.data["message"] ?? ""}";

            error.response!.data["errors"]?.forEach((k, v) {
              _errorMessage = _errorMessage + "${v[0] ?? ""}\n";
            });

            _errorMessage = _errorMessage.trim() == ""
                ? "Unknown error"
                : _errorMessage.trim();
            break;
          case DioErrorType.sendTimeout:
            _errorMessage = "Receive timeout in send request";
            break;
        }

        throw (_errorMessage);
      }

      throw ("$error");
    }

    return response;
  }
}
