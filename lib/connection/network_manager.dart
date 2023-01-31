import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:lenzcamera/connection/network_connection.dart';
import 'package:lenzcamera/model/address_list.dart';
import 'package:lenzcamera/model/base_response.dart';
import 'package:lenzcamera/model/cart.dart';
import 'package:lenzcamera/model/city_list.dart';
import 'package:lenzcamera/model/company_policy.dart';
import 'package:lenzcamera/model/customer.dart';
import 'package:lenzcamera/model/details.dart';
import 'package:lenzcamera/model/filter_data.dart';
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
import 'package:lenzcamera/model/review_details.dart';
import 'package:lenzcamera/model/review_response.dart';
import 'package:lenzcamera/model/search_filter_response.dart';

import 'package:lenzcamera/model/search_products_response.dart';
import 'package:lenzcamera/model/single_order_detail.dart';
import 'package:lenzcamera/model/state_list.dart';
import 'package:lenzcamera/model/top_categories.dart';
import 'package:lenzcamera/model/user_location.dart';
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
  late String userToken;
  late String otp;
  late String otpurlkey;
  late int userId;
  late String catUrlKey;

  init() {
    dio = Dio();
    networkConnection = NetworkConnection(dio!);
  }

  void refreshTokens() {
    SessionsManager.getUserToken().then((token) {
      token = (token ?? "");
      userToken = token.isEmpty ? "" : token;
    });

    SessionsManager.getUserId().then((value) {
      userId = value ?? 0;
      print("UserIdNM${userId}");
    });
  }

  Future<BaseResponse<List<Location>>> custLocation(String search) {
    return call(networkConnection.custLocation(search));
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

  Future<BaseResponse<List<AddressList>>> getAddressList() {
    return call(networkConnection.getAddressList(userId));
  }

  Future<BaseResponse<List<CityList>>> cityListAddress(int id) {
    return call(networkConnection.cityListAddress(id));
  }

  Future<BaseResponse<List<StateList>>> stateListAddress() {
    return call(networkConnection.stateListAddress(int.parse("178")));
  }

  Future<BaseResponse> updateAddress(Map<String, dynamic> map) {
    return call(networkConnection.updateAddress(map));
  }

  Future<BaseResponse> deleteAddress(String cusAddress_id) {
    return call(networkConnection.deleteAddress(cusAddress_id));
  }

  // Future<BaseResponse> deleteAddress(Map<String, dynamic> map) {
  //   return call(networkConnection.deleteAddress(map));
  // }

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

  Future<BaseResponse> changePassword(Map<String, dynamic> map) {
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

  Future<BaseResponse<Product>> getSingleProductDetails(
      Map<String, dynamic> map) {
    return call(
        networkConnection.getSingleProductDetails(userId, 0, map['urlKey'], 8));
  }

  //  Future<BaseResponse<ProductDetail>> getSingleProductDetails(
  //     int userId, int guestId,String urlKey, int pincode ) {
  //   return call(networkConnection.getSingleProductDetails(
  //     userId, guestId, urlKey, pincode ));
  // }

  Future<BaseResponse<SearchFilterResponse>> searchFilter(
      Map<String, dynamic> map) {
    return call(networkConnection.searchFilter(map));
  }

  Future<BaseResponse> addReview(Map<String, dynamic> map) {
    return call(networkConnection.addReview(map));
  }

  // Future<BaseResponse<ReviewResponse>> productReview(Map<String, dynamic> map) {
  //   return call(networkConnection.productReview(CustId, map["urlKey"]));
  // }

  Future<BaseResponse<ReviewResponse>> productReview(Map<String, dynamic> map) {
    return call(networkConnection.productReview(map["urlKey"], userId));
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

  Future<BaseResponse<MainBanner>> getBanner(
      int custId, int guestId, int pincode) {
    return call(networkConnection.getBanner(custId, guestId, pincode));
  }

  Future<BaseResponse<List<Product>>> getWishList() {
    return call(networkConnection.getWishList(userId, 0));
  }

  Future<BaseResponse> addToWishlist(Map<String, dynamic> map) {
    return call(networkConnection.addToWishlist(map));
  }

  Future<BaseResponse> removeFromWishlist(
      int userId, String? guestId, String urlKey) {
    print("useriddd $userId");
    // print("guestIddd $guestId");
    print("urlKeyyy $urlKey");
    return call(networkConnection.removeFromWishlist(userId, guestId, urlKey));
  }

  Future<BaseResponse<Profile>> getProfile() {
    return call(networkConnection.getProfile(userId));
  }

  Future<BaseResponse> updateProfile(Map<String, dynamic> map) {
    return call(networkConnection.updateProfile(map));
  }

  Future<BaseResponse<CartResponse>> getCart(
      int cusId, int guestId, int pincode) {
    return call(networkConnection.getCart(cusId, guestId, pincode));
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

  //   Future<BaseResponse<SingleOrderDetail>> orderItemDetails( int orderId) {
  //   return call(networkConnection.orderItemDetails(orderId));
  // }

  Future<BaseResponse<SingleOrderDetail>> orderDetails(int orderId) {
    return call(networkConnection.orderDetails(orderId));
  }

  Future<BaseResponse> placeOrder(Map<String, dynamic> map) {
    return call(networkConnection.placeOrder(map));
  }

  Future<BaseResponse> cancelOrder(int orderId, int custId) {
    return call(networkConnection.cancelOrder(orderId, custId));
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
            if (error.response!.statusCode == 400) {
              _errorMessage = error.response!.data['Message'];
            }
            // if (error.response?.statusCode == 401) {
            //   _errorMessage = "Session timeout";
            //   // DataManager.shared.onTokenExpired!();
            //   throw (_errorMessage);
            // }

            // if (error.response?.statusCode == 401 ||
            //     error.response?.statusCode == 400) {
            //   if (error.response!.data["data"] is Iterable) {
            //     for (Map m in error.response!.data["data"]) {
            //       _errorMessage = _errorMessage + m["message"] + "\n";
            //     }
            //   } else {
            //     _errorMessage = "${error.response!.data["message"] ?? ""}";
            //   }
            //   _errorMessage = _errorMessage.trim() == ""
            //       ? "Unknown error"
            //       : _errorMessage.trim();
            //   throw (_errorMessage);
            // }

            // if (error.response!.statusCode == 400 ||
            //     error.response!.data["data"] == null) {
            //   _errorMessage = error.response!.data["message"];
            //   print(error.response!.data["data"]);
            // }

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
            _errorMessage = "${error.response!.data["Message"] ?? ""}";

            error.response!.data["errors"]?.forEach((k, v) {
              _errorMessage = _errorMessage + "${v[0] ?? ""}\n";
            });
            _errorMessage = _errorMessage.trim() == ""
                ? error.response!.data['Message']
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
