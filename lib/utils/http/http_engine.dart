import 'dart:io';
import 'dart:ui';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'http_config.dart';
import 'http_parse.dart';
import 'http_transformer.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpEngine {
  final HttpConfig _config;
  final CancelToken _cancelToken = CancelToken();
  late Dio _dio;

  Dio get dio {
    return _dio;
  }

  HttpEngine._internal(this._config) {
    BaseOptions options = BaseOptions(
        baseUrl: _config.baseUrl,
        connectTimeout: _config.connectTimeout,
        receiveTimeout: _config.receiveTimeout,
        contentType: Headers.jsonContentType);

    // DioCacheManager
    final cacheOptions = CacheOptions(
      // A default store is required for interceptor.
      store: MemCacheStore(),
      // Optional. Returns a cached response on error but for statuses 401 & 403.
      hitCacheOnErrorExcept: [401, 403],
      // Optional. Overrides any HTTP directive to delete entry past this duration.
      maxStale: const Duration(days: 7),
    );

    List<Interceptor> interceptors = [
      DioCacheInterceptor(options: cacheOptions),
      PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true),
    ];
    if (_config.interceptors != null && _config.interceptors!.isNotEmpty) {
      interceptors.addAll(_config.interceptors!);
    }
    // Cookie管理
    if (_config?.cookiesPath?.isNotEmpty ?? false) {
      interceptors.add(CookieManager(
          PersistCookieJar(storage: FileStorage(_config!.cookiesPath))));
    }

    _dio = Dio(options);
    _dio.interceptors.addAll(interceptors);
    proxy(_dio);
    // proxy(retry);
  }

  void proxy(Dio dio) {
    String? porxy = _config.proxy;
    if (porxy != null) {
      (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
          (client) {
        client.findProxy = (uri) {
          return "PROXY $porxy";
        };
        //代理工具会提供一个抓包的自签名证书，会通不过证书校验，所以我们禁用证书校验
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
      };
    }
  }

  String? getProxy() {
    return _config.proxy;
  }

  static final Map<String, HttpEngine> _engineMap = {};

  static HttpEngine instance(
    HttpConfig config, {
    BaseOptions? options,
  }) {
    if (!_engineMap.containsKey(config.baseUrl)) {
      _engineMap[config.baseUrl] = HttpEngine._internal(config);
    }
    return _engineMap[config.baseUrl]!;
  }

  Map<String, DateTime> reqTimes = {};

  /// 请求，返回参数为 HttpResponse
  /// [method]：请求方法，Method.POST等
  /// [path]：请求地址
  /// [params]：请求参数
  /// [success]：请求成功回调
  /// [error]：请求失败回调
  Future execute<HttpResponse>(
    Method method,
    String path, {
    data,
    HttpTransformer? format,
    Map<String, dynamic>? params,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      reqTimes[path] = DateTime.now();
      Response response = await dio.request(path,
          data: data,
          queryParameters: params,
          options: options != null
              ? options.copyWith(method: _methodValues[method])
              : Options(
                  method: _methodValues[method],
                ));
      print("$path 请求耗时:${DateTime.now().difference(reqTimes[path]!).inMilliseconds} 毫秒");
      return handleResponse(response, format ?? _config.format);
    } on Exception catch (e) {
      return handleException(e);
    }
  }

  static destroy() {
    _engineMap.clear();
  }

}

///请求类型枚举
enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }

///请求类型值
const _methodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};
