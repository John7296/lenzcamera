import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lenzcamera/connection/network_connection.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/order_list.dart';
import 'package:lenzcamera/model/product.dart';
import 'package:lenzcamera/model/product_detail.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/home_details.dart';
import 'package:lenzcamera/model/login_customer.dart';
import 'package:lenzcamera/model/new_register.dart';
import 'package:lenzcamera/model/profile.dart';
import 'package:lenzcamera/model/related_products.dart';
import 'package:lenzcamera/model/search_filter_response.dart';

import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/model/state_list.dart';
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
  late int userId;

  init() {
    dio = Dio();
    networkConnection = NetworkConnection(dio!);
  }

  void refreshTokens() {
    SessionsManager.getUserToken().then((token) {
      token = (token ?? "");
      userKey = token.isEmpty ? "" : "Bearer $token";
    });

    SessionsManager.getUserId().then((value) {
      userId = value!;
      print("UserIdNM${userId}");
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

  Future<BaseResponse<List<AddressList>>> getAddressList() {
    return call(networkConnection.getAddressList(userId));
  }

  Future<BaseResponse<List<CityList>>> cityListAddress() {
    return call(networkConnection.cityListAddress(int.parse("2920")));
  }

  Future<BaseResponse<List<StateList>>> stateListAddress() {
    return call(networkConnection.stateListAddress(int.parse("178")));
  }

  Future<BaseResponse> updateAddress(Map<String, dynamic> map) {
    return call(networkConnection.updateAddress(map));
  }

  Future<BaseResponse> deleteAddress(Map<String, dynamic> map) {
    return call(networkConnection.deleteAddress(map));
  }

  Future<BaseResponse> forgotPasswordOTPSend(
      String email, String mobileNumber) {
    return call(networkConnection.forgotPasswordOTPSend(email, mobileNumber));
  }

  Future<BaseResponse> verifyForgotPasswordOTP(Map<String, dynamic> map) {
    return call(networkConnection.verifyForgotPasswordOTP(
        map['OTP'], map['OtpUrlKey']));
  }

  Future<BaseResponse> resetPassword(Map<String, dynamic> map) {
    return call(
        networkConnection.resetPassword(map['OtpUrlKey'], map['password']));
  }

  Future<BaseResponse<LoginCustomer>> changePassword(Map<String, dynamic> map) {
    return call(networkConnection.changePassword(map));
  }

  Future<BaseResponse> supportMessageSend(Map<String, dynamic> map) {
    return call(networkConnection.supportMessageSend(map));
  }

  Future<BaseResponse<LoginCustomer>> customerDetails(int custId) {
    return call(networkConnection.customerDetails(custId));
  }

  Future<BaseResponse<SearchProductsResponse>> searchProducts(
      Map<String, dynamic> map) {
    return call(networkConnection.searchProducts(map));
  }

  Future<BaseResponse<ProductDetail>> getSingleProductDetails(
      Map<String, dynamic> map) {
    return call(networkConnection.getSingleProductDetails(
        "canon-lpe6nh-battery-og", userId, 0, int.parse("8")));
  }

  Future<BaseResponse<SearchFilterResponse>> searchFilter(
      Map<String, dynamic> map) {
    return call(networkConnection.searchFilter(map));
  }

  Future<BaseResponse> addReview(Map<String, dynamic> map) {
    return call(networkConnection.addReview(map));
  }

  Future<BaseResponse> verifyOtp(Map<String, dynamic> map) {
    return call(
        networkConnection.verifyOtp(int.parse(map['OTP']), map['OtpUrlKey']));
  }

  Future<BaseResponse<List<Product>>> featuredProducts() {
    return call(networkConnection.featuredProducts(userId, 0));
  }

  Future<BaseResponse<List<Product>>> popularProducts() {
    return call(networkConnection.popularProducts(userId, 0));
  }

  Future<BaseResponse<List<Product>>> recentProducts() {
    return call(networkConnection.recentProducts(userId, 0));
  }

  // Future<BaseResponse<List<Product>>> recentProducts(Map<String, dynamic> map) {
  //   return call(networkConnection.recentProducts(map["custId"], map["guestId"]));
  // }

  Future<BaseResponse<List<HomeDetails>>> homeDetails() {
    return call(networkConnection.homeDetails(userId, 0));
  }

  Future<BaseResponse<List<Product>>> getWishList() {
    return call(networkConnection.getWishList(userId, 0));
  }

  Future<BaseResponse> addToWishlist(Map<String, dynamic> map) {
    return call(networkConnection.addToWishlist(map));
  }

  Future<BaseResponse> removeFromWishlist(Map<String, dynamic> map) {
    return call(networkConnection.removeFromWishlist(
        map[userId], map["guestId"], map["urlKey"]));
  }

  Future<BaseResponse<Profile>> getProfile() {
    return call(networkConnection.getProfile(userId));
  }

  Future<BaseResponse> updateProfile(Map<String, dynamic> map) {
    return call(networkConnection.updateProfile(map));
  }

  Future<BaseResponse<CartResponse>> getCart(Map<String, dynamic> map) {
    return call(networkConnection.getCart(
        map["cusId"], map["guestId"], map["pincode"]));
  }

  Future<BaseResponse> addToCart(Map<String, dynamic> map) {
    return call(networkConnection.addToCart(map));
  }

  Future<BaseResponse> removeFromCart(Map<String, dynamic> map) {
    return call(networkConnection.removeFromCart(map));
  }

  Future<BaseResponse> subCartQty(Map<String, dynamic> map) {
    return call(networkConnection.subCartQty(map));
  }

  Future<BaseResponse> addCartQty(int cartItemId) {
    return call(networkConnection.addCartQty(cartItemId));
  }

  Future<BaseResponse<List<OrderList>>> getOrderList() {
    return call(networkConnection.getOrderList(userId));
  }

  Future<BaseResponse> placeOrder(Map<String, dynamic> map) {
    return call(networkConnection.placeOrder(map));
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
