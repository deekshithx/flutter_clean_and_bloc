// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AppApiService implements AppApiService {
  _AppApiService(this._dio) {
    baseUrl ??= 'https://reqres.in/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<List<UserModel>>> getUsersList({page}) async {
    const extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final headers = <String, dynamic>{};
    final data = <String, dynamic>{};
    final result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<List<UserModel>>>(
            Options(method: 'GET', headers: headers, extra: extra)
                .compose(_dio.options, '/api/users',
                    queryParameters: queryParameters, data: data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    List<UserModel> value = result.data?['data']
        .map<UserModel>(
            (dynamic i) => UserModel.fromJson(i as Map<String, dynamic>))
        .toList();
    final httpResponse = HttpResponse(value, result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
