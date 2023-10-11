import 'package:ashyk_aydyn_com/src/screens/initial/model/new_videos_model.dart';
import 'package:ashyk_aydyn_com/src/screens/initial/repositorys/new_videos_repository.dart';
import 'package:flutter/material.dart';

class NewVideosProvider with ChangeNotifier {
  final NewVideosRepository useCase = NewVideosRepository();
  bool isLoading = false;
  bool waiting = false;

  List<DataNewVideos> newVideos = [];

  Future<void> fetchNewVideos() async {
    final result = await useCase.fetchData();

    isLoading = true;
    notifyListeners();
    if (result.statusCode == 200) {
      if (result.data != null) {
        newVideos = List<DataNewVideos>.from(result.data['data'].map((e) {
          return DataNewVideos.fromJson(e);
        }));

        isLoading = false;
        notifyListeners();
      }
      return;
    }
  }
}
