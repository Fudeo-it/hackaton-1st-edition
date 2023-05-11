import 'dart:io';

import 'package:dio/dio.dart';

class AuthInterceptor extends QueuedInterceptor {
  static const String _token =
      "secret_Azc2DHy4JY0Ved0cD0ObrEFJqIaUqy96CboXgJZp8bZ";

  AuthInterceptor();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers[HttpHeaders.authorizationHeader] = "Bearer $_token";
    options.headers['Notion-Version'] = "2022-06-28";

    super.onRequest(options, handler);
  }
}
