import 'dart:convert';
import 'dart:io';
import 'package:dio/io.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:flutter/services.dart';

import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:job_app/app/resources/app_consts.dart';
import 'package:job_app/app/resources/string_constants.dart';
import 'package:job_app/core/log/api_client_logger.dart';


class DioClient with ApiClientLoggy {
  static Future<Dio> createDio({bool isMock = false}) async {
    final dio = Dio(BaseOptions());
    dio.interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          // store: HiveCacheStore(AppPathProvider.path),
          store: MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576),
          policy: CachePolicy.refreshForceCache,
          keyBuilder: (request) {
            return request.uri.toString();
          },
          hitCacheOnErrorExcept: [],
          maxStale: const Duration(
            days: AppConsts.cacheDays,
          ),
          //increase number of days for loger cache
          priority: CachePriority.high,
          allowPostMethod: true,
        ),
      ),
    );
    //this is for avoiding certificates error cause by dio
    //https://issueexplorer.com/issue/flutterchina/dio/1285

    (dio.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    dio.options.headers["authorization"] = StringConsts.authToken;
    dio.options.headers["Notion-Version"] = "2022-06-28";
    if (isMock) {
      final dioAdapter = DioAdapter(dio: dio);

      final data = await rootBundle.load('assets/json/dummy_annunci.json');

      dioAdapter.onPost(StringConsts.baseUrlAziende, (server) {
        final map = jsonDecode(
          utf8.decode(
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes),
          ),
        );
        return server.reply(
          200,
          map,
          // Reply would wait for one-sec before returning data.
          delay: const Duration(seconds: 1),
        );
      }, data: {});
    }

    return Future.value(dio);
  }
}
