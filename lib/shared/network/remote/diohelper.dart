import 'package:dio/dio.dart';

class Diohelper {
  static Dio? dio;
  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl:
              'https://student.valuxapps.com/api/' /*'https://newsapi.org/'*/,
          receiveDataWhenStatusError: true,
          headers: {'Content-Type': 'application/json'}),
    );
  }

  static Future<Response> getData(
      {required String url,
      required Map<String, dynamic> query,
      String lang = 'ar',
      String? auth}) async {
    dio!.options.headers = {'lang': lang, 'authorization': auth};

    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData(
      {required String url,
      Map<String, dynamic>? query,
      required Map<String, dynamic> data,
      String lang = 'ar',
      String? auth}) async {
    dio!.options.headers = {'lang': lang, 'authorization': auth};
    return dio!.post(url, queryParameters: query, data: data);
  }
}
