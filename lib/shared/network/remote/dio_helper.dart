import 'package:dio/dio.dart';

class DioHelper
{
  static late Dio dio;

  static init()
  {
     dio = Dio(
        BaseOptions(
          baseUrl: "https://www.itkan.online/",
          receiveDataWhenStatusError: true,

       ),
    );

  }
  Future<Response> getData({
  required String url,
  required  Map<String, dynamic> query,
}) async
  {
    return await   dio.get(url, queryParameters: query,);
  }
}