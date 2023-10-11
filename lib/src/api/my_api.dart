import 'package:ashyk_aydyn_com/src/design/constants.dart';
import 'package:dio/dio.dart';

class MyApiDataSource {
  static Dio dio = Dio();
  Future<Response> fetchDataCatigorys() async {
    final response = await dio.get("${Constants.baseUrl}/front/categories");
    return response;
  }

  Future<Response> fetchDataNewVideos() async {
    final response = await dio.get("${Constants.baseUrl}/front/new_videos");
    return response;
  }

  Future<Response> fetchDataFile(int id) async {
    final response = await dio.get("${Constants.baseUrl}/front/file/$id");
    return response;
  }

  Future<Response> fetchDataSubcategory(int id) async {
    final response =
        await dio.get("${Constants.baseUrl}/front/subcategory/$id");
    return response;
  }

  Future<Response> fetchDataDownload(int id) async {
    final response = await dio.get("${Constants.baseUrl}/front/download/$id");
    return response;
  }
}
