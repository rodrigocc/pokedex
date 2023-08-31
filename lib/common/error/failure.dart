import 'package:dio/dio.dart';

enum FailureType { none, base, http }

class Failure implements Exception {
  final FailureType faituleType;
  final String? message;
  final Response? response;

  Failure({required this.faituleType, this.message, this.response});
}
