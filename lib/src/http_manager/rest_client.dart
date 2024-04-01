import 'package:dio/dio.dart';
import 'package:dio/io.dart';

final class RestClient extends DioForNative {
  RestClient()
      : super(BaseOptions(
            connectTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 40))) {
              interceptors.addAll([
                 LogInterceptor(requestBody: true, responseBody: true),
              ]);
            }

  RestClient get auth {
    options.extra["DIO_AUTH_KEY"] = true;
    return this;
  }

  RestClient get unauth {
    options.extra["DIO_AUTH_KEY"] = false;
    return this;
  }
}