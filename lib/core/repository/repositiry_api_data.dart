import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiData {
  Dio _dio = Dio();

  ApiData() {
    _dio.options.baseUrl = "https://interview.flexioninfotech.com";
    _dio.interceptors.add(PrettyDioLogger());
  }

  Dio get sendRequest => _dio;
}
