import 'package:ashyk_aydyn_com/src/api/my_api.dart';
import 'package:dio/dio.dart';

class FilesRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response> fetchData(int id) async {
    final response = await apiDataSource.fetchDataFile(id);
    return response;
  }
}
