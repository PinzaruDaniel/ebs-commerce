import 'package:data/modules/auth/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/refresh')
  Future<AuthTokensApiDto> refresh(@Body() Map<String, dynamic> body);

  @POST('/auth/login')
  Future<AuthTokensApiDto> login(@Body() Map<String, dynamic> body);

  //TODO: to move in another api service,

}
