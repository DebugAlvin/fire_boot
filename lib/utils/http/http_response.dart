
import 'exception/http_exceptions.dart';

class HttpResponse {
  late bool ok;
  dynamic? data;
  final int? statusCode;
  String? msg;
  HttpException? error;

  HttpResponse._internal(this.statusCode, {this.ok = false});

  HttpResponse.success(this.data, this.statusCode, this.msg) {
    ok = true;
  }

  HttpResponse.failure({String? errorMsg, int? errorCode,this.statusCode = -1}) {
    error = BadRequestException(message: errorMsg, code: errorCode);
    ok = false;
  }

  HttpResponse.failureFormResponse({dynamic? data,this.statusCode = -1}) {
    error = BadResponseException(data);
    ok = false;
  }

  HttpResponse.failureFromError(this.statusCode, [HttpException? error]) {
    error = error ?? UnknownException();
    ok = false;
  }
}