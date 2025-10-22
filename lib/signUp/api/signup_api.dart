import 'package:dio/dio.dart';
import 'package:flutter_application_1/signUp/data/signUp_request.dart';
import 'package:flutter_application_1/signUp/data/signUp_reseponse.dart';

import 'package:retrofit/retrofit.dart';

part 'signup_api.g.dart';

@RestApi(baseUrl: "https://us-central1-skin-scanner-3c419.cloudfunctions.net/base/v1")
abstract class SignupApi {
  factory SignupApi(Dio dio, {String baseUrl}) = _SignupApi;

  @POST("/auth-service/register")
  Future<HttpResponse<SignupReseponse>> signup(@Body() SignupRequest post);
  
}