import 'package:dio/dio.dart';
import 'http_transformer.dart';

class HttpConfig{
  final String baseUrl;
  String? proxy;
  final String? cookiesPath;
  final List<Interceptor>? interceptors;
  final int connectTimeout;
  final int sendTimeout;
  final int receiveTimeout;
  final Map<String, dynamic>? headers;
  final HttpTransformer? format;

  HttpConfig(this.baseUrl, {
    this.proxy,
    this.cookiesPath,
    this.interceptors,
    this.connectTimeout = Duration.millisecondsPerMinute,
    this.sendTimeout = Duration.millisecondsPerMinute,
    this.receiveTimeout = Duration.millisecondsPerMinute,
    this.headers,
    this.format,
  });
}