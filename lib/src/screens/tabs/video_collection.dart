import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/subcaigory_provider.dart';
import '../initial/page/info_page.dart';

class VideoCollection extends StatefulWidget {
  const VideoCollection({super.key});

  @override
  State<VideoCollection> createState() => _VideoCollectionState();
}

class _VideoCollectionState extends State<VideoCollection> {
  @override
  Widget build(BuildContext context) {
    final subcatigoeyProvider = context.watch<SubcatigoeyProvider>();
    return SafeArea(
      child: subcatigoeyProvider.subcatogoryModel!.videos.isEmpty
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Klip ýok',
                style: TextStyle(fontSize: 18),
              ),
            )
          : GridView.builder(
              padding: const EdgeInsets.only(bottom: 10, right: 10, top: 8),
              itemCount: subcatigoeyProvider.subcatogoryModel?.videos.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 8.0,
              ),
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => InfoPage(
                          id: subcatigoeyProvider
                              .subcatogoryModel!.videos[index].id,
                          url: subcatigoeyProvider
                              .subcatogoryModel!.videos[index].fileUrl,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        width: 170,
                        padding: const EdgeInsets.only(
                          left: 10,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            subcatigoeyProvider
                                .subcatogoryModel!.videos[index].image,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 5,
                        ),
                        child: Text(
                          subcatigoeyProvider
                                .subcatogoryModel?.videos[index].title?? '',
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
