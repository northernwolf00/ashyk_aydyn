import 'package:ashyk_aydyn_com/src/screens/initial/model/subcatigory_model.dart';
import 'package:ashyk_aydyn_com/src/screens/initial/repositorys/subcatigoey_repository.dart';
import 'package:flutter/material.dart';

class SubcatigoeyProvider with ChangeNotifier {
  final SubcatigoryRepository useCase = SubcatigoryRepository();
  bool isLoading = false;
  bool waiting = false;

  SubcatogoryModel? subcatogoryModel;

  Future<void> fetchSubcatigory(int id) async {
    final result = await useCase.fetchData(id);
    print(result);
    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      if (result.data != null) {
        subcatogoryModel = SubcatogoryModel.fromJson(result.data['data']);

        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
