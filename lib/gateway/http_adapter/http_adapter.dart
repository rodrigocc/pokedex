import 'package:dio/dio.dart';
import 'package:pokemon_consome_api/common/consts/api_consts.dart';
import 'package:pokemon_consome_api/common/error/failure.dart';
import 'package:pokemon_consome_api/common/error/http_failure.dart';

enum HttpMethod {
  get('GET');

  const HttpMethod(this.method);

  final String method;
}

abstract class HttpAdapter {
  Future<Response> apitRequest({
    required HttpMethod apitMethod,
    String? path,
    dynamic data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  });
}

class HttpAdpaterImpl implements HttpAdapter {
  final Dio _http;
  final Map<String, dynamic>? baseHeaders;

  HttpAdpaterImpl({this.baseHeaders})
      : _http = Dio(BaseOptions(
          baseUrl: ApiConsts.allPokemonsURL,
          headers: baseHeaders,
        ))
          ..interceptors.addAll([
            LogInterceptor(
              responseBody: false,
              requestBody: false,
              request: false,
            ),
          ]);

  @override
  Future<Response> apitRequest({
    required HttpMethod apitMethod,
    String? path,
    data,
    Map<String, dynamic>? params,
    Map<String, dynamic>? headers,
  }) async {
    try {
      return _http.request(
        path ?? '',
        data: data,
        queryParameters: params,
        options: Options(
          method: apitMethod.method,
          headers: headers,
        ),
      );
    } on DioException catch (error) {
      return Future.error(
          HttpFailure(message: error.message, response: error.response));
    } catch (error) {
      return Future.error(
          Failure(faituleType: FailureType.base, message: error.toString()));
    }
  }
}
