import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../models/remote/index.dart';

part 'states_api_service.g.dart';

@RestApi(baseUrl: '')
abstract class StatesApiService {
  factory StatesApiService(Dio dio, {String baseUrl}) = _StatesApiService;

  @POST('/states')
  Future<StatesApiDto> getStates(@Body() Map<String, dynamic> body);
}