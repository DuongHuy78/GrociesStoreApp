import 'package:dio/dio.dart';
import 'package:flutter_application_1/login/data/login_request.dart';
import 'package:flutter_application_1/login/data/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'login_api.g.dart';

@RestApi(baseUrl: "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1")
abstract class LoginApi {
  factory LoginApi(Dio dio, {String baseUrl}) = _LoginApi;

  @POST("/auth-service/login")
  Future<HttpResponse<LoginResponse>> login(@Body() LoginRequest post);
  
}