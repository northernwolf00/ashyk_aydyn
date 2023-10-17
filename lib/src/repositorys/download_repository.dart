import 'package:ashyk_aydyn_com/src/api/my_api.dart';
import 'package:dio/dio.dart';

class DownloadRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response> fetchData(int id) async {
    final response = await apiDataSource.fetchDataDownload(id);
    return response;
  }
}