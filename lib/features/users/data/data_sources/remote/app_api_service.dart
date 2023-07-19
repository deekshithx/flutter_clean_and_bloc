import 'package:clean_and_bloc/features/users/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';

part 'app_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class AppApiService {
  factory AppApiService(Dio dio) = _AppApiService;

  @GET('/api/users')
  Future<HttpResponse<List<UserModel>>> getUsersList({
    @Query("page") String? page,
  });
}
