import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/subcaigory_provider.dart';

class MusicCollection extends StatefulWidget {
  const MusicCollection({super.key});

  @override
  State<MusicCollection> createState() => _MusicCollectionState();
}

class _MusicCollectionState extends State<MusicCollection> {
  @override
  Widget build(BuildContext context) {
    final subcatigoeyProvider = context.watch<SubcatigoeyProvider>();
    return SafeArea(
      child: subcatigoeyProvider.subcatogoryModel!.musics.isEmpty
          ? Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Aýdym ýok', style: TextStyle(fontSize: 18),),
          )
          : GridView.builder(
              padding: const EdgeInsets.only(bottom: 10, right: 10, top: 8),
              itemCount: subcatigoeyProvider.subcatogoryModel?.musics.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, index) {
                return Container(
                  width: 170,
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    // child: Image.network(
                    //   subcatigoeyProvider.subcatogoryModel.musics,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                );
              },
            ),
    );
  }
}
