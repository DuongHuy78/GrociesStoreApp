import 'package:dio/dio.dart';
import 'package:flutter_application_1/account/data/account_response.dart';
import 'package:retrofit/retrofit.dart';

part 'account_api.g.dart';

@RestApi(baseUrl: "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1")
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;

  @GET("/user-service/me")
  Future<HttpResponse<AccountResponse>> getInfor();
  
}