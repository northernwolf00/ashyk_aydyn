import 'package:ashyk_aydyn_com/src/providers/file_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/intial_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/new_videos_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/subcaigory_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<Initial> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  fetchData() async {
    await Provider.of<InitialProvider>(context, listen: false).fetchCatigorys();
    // ignore: use_build_context_synchronously
    await Provider.of<NewVideosProvider>(context, listen: false)
        .fetchNewVideos();
    // ignore: use_build_context_synchronously
    await Provider.of<SubcatigoeyProvider>(context, listen: false)
        .fetchSubcatigory(60);

    // ignore: use_build_context_synchronously
    await Provider.of<FileProvider>(context, listen: false).fetchFile(41);
  }

  @override
  Widget build(BuildContext context) {
    final myViewModel = context.watch<InitialProvider>();
    final newVideos = context.watch<NewVideosProvider>();
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10, top: 15, bottom: 10),
                child: Text(
                  'Täze klipler',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newVideos.newVideos.length,
                  itemBuilder: (BuildContext context, indexx) {
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: 10),
                          height: 250,
                          width: 170,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                            child: Image.network(
                              newVideos.newVideos[indexx].image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: myViewModel.initial.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 15, bottom: 10),
                        child: Text(
                          myViewModel.initial[index].title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 220,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              myViewModel.initial[index].subcategories.length,
                          itemBuilder: (BuildContext context, indexx) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(right: 10),
                                  height: 210,
                                  width: 170,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.network(
                                      myViewModel.initial[index]
                                          .subcategories[indexx].icon,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
