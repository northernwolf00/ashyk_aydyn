import 'package:ashyk_aydyn_com/src/api/my_api.dart';
import 'package:dio/dio.dart';

class NewVideosRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response> fetchData() async {
    final response = await apiDataSource.fetchDataNewVideos();
    return response;
  }
}
