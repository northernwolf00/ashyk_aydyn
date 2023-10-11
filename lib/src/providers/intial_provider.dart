import 'package:ashyk_aydyn_com/src/model/initial_model.dart';
import 'package:ashyk_aydyn_com/src/repositorys/catigorys.dart';
import 'package:flutter/material.dart';

class InitialProvider with ChangeNotifier {
  final CatigorysRepository useCase = CatigorysRepository();
  bool isLoading = false;
  bool waiting = false;

  List<DataItem> initial = [];

  Future<void> fetchCatigorys() async {
    final result = await useCase.fetchData();

    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      if (result.data != null) {
        initial = List<DataItem>.from(result.data['data'].map((e) {
          return DataItem.fromJson(e);
        }));

        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
