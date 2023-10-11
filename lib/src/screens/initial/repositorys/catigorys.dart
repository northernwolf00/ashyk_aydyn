import 'package:ashyk_aydyn_com/src/api/my_api.dart';
import 'package:dio/dio.dart';

class CatigorysRepository {
  final MyApiDataSource apiDataSource = MyApiDataSource();

  Future<Response> fetchData() async {
    final response = await apiDataSource.fetchDataCatigorys();
    return response;
  }
}
