import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart' as services;

var dio = Dio();
void initDio() {
  Dio tokenDio = Dio();
  String baseUrl = dotenv.env['SERVER_ADDRESS']!;

  dio.options.baseUrl = baseUrl;
  tokenDio.options.baseUrl = baseUrl;

  dio.options.headers['content-Type'] = 'application/json';
}
