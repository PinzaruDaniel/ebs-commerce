import 'package:data/modules/auth/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApiService {
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  @POST('/auth/refresh')
  Future<AuthTokensApiDto> refresh(@Body() RefreshRequest request);

  @POST('/auth/login')
  Future<AuthTokensApiDto> login(@Body() LoginRequest request);
}

class RefreshRequest {
  final String refreshToken;

  RefreshRequest(this.refreshToken);

  Map<String, dynamic> toJson() => {'refreshToken': refreshToken};
}

class LoginRequest {
  final String email;
  final String password;

  LoginRequest(this.email, this.password);

  Map<String, dynamic> toJson() => {'email': email, 'password': password};
}
