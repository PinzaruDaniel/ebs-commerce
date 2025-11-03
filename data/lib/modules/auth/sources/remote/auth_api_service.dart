import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'auth_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class AuthApiService{
  factory AuthApiService(Dio dio, {String baseUrl})=_AuthApiService;

/*@POST('/auth/login')
  Future<>*/

}