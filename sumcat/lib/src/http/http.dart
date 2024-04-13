library http;

import 'dart:async';
import 'dart:io';

part './request_handler.dart';
part './methods.dart';
part './server.dart';
part './final_handler.dart';
part './error/error.dart';

///对[HttpRequest]的封装
class HttpRequestWrapper {
  final Map<String, dynamic> _params = {};
  final HttpRequest _inner;
  String _baseUrl = '';

  HttpRequestWrapper(this._inner);

  HttpRequest get inner => _inner;
  Map<String, dynamic> get params => _params;
}

class HttpRequestWrapperInternal extends HttpRequestWrapper {
  WebSocket? _ws;
  HttpRequestWrapperInternal(HttpRequest inner) : super(inner);
  String get baseUrl => _baseUrl;
  set baseUrl(value) => _baseUrl = value;
  WebSocket? get ws => _ws;
  set ws(WebSocket? value) => _ws = value;
}

///对[HttpResponse]的封装
class HttpResponseWrapper {
  final HttpResponse _inner;

  HttpResponse get inner => _inner;

  HttpResponseWrapper(this._inner);
}

class HttpResponseWrapperInternal extends HttpResponseWrapper {
  HttpResponseWrapperInternal(HttpResponse inner) : super(inner);
}
