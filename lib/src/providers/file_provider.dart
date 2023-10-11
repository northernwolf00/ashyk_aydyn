import 'package:ashyk_aydyn_com/src/model/file_model.dart';
import 'package:ashyk_aydyn_com/src/repositorys/file_repository.dart';
import 'package:flutter/material.dart';

class FileProvider with ChangeNotifier {
  final FilesRepository useCase = FilesRepository();
  bool isLoading = false;
  bool waiting = false;

  FileModel? fileModel;

  Future<void> fetchFile(int id) async {
    final result = await useCase.fetchData(id);

    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      if (result.data != null) {
        fileModel = FileModel.fromJson(result.data['data']);

        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
