import 'dart:io';

import 'package:clean_and_bloc/core/resources/data_state.dart';
import 'package:clean_and_bloc/features/users/data/data_sources/remote/app_api_service.dart';
import 'package:clean_and_bloc/features/users/domain/repository/user_repository.dart';
import 'package:dio/dio.dart';

import '../models/user.dart';

class UserRepositoryImpl implements UserRepository {
  final AppApiService _appApiService;

  UserRepositoryImpl(this._appApiService);

  @override
  Future<DataState<List<UserModel>>> getUsersList(int page) async {
    try {
      final httpResponse = await _appApiService.getUsersList(
        page: page.toString(),
      );

      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse,
            requestOptions: httpResponse.response.requestOptions));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
