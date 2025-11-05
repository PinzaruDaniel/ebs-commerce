import 'package:data/modules/user/models/remote/index.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'current_user_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class CurrentUserApiService {
  factory CurrentUserApiService(Dio dio, {String baseUrl}) = _CurrentUserApiService;

  @GET('/user')
  Future<UserApiDto> getUserApi(@Header('Authorization') String accessToken);
}
