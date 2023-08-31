import 'package:dio/dio.dart';
import 'package:pokemon_consome_api/common/error/failure.dart';

class HttpFailure extends Failure {
  HttpFailure({String? message, Response? response})
      : super(
          faituleType: FailureType.http,
          message: message,
          response: response,
        );
}
