import 'package:ashyk_aydyn_com/src/providers/intial_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/new_videos_provider.dart';
import 'package:ashyk_aydyn_com/src/screens/initial/page/detail_page.dart';
import 'package:ashyk_aydyn_com/src/screens/initial/page/info_page.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final myViewModel = context.watch<InitialProvider>();
    final newVideos = context.watch<NewVideosProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'AŞYK AÝDYŇ',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
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
                height: 240,
                child: ListView.builder(
                  padding: const EdgeInsets.only(left: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newVideos.newVideos.length,
                  itemBuilder: (BuildContext context, indexx) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => InfoPage(
                              id: newVideos.newVideos[indexx].id,
                              url: newVideos.newVideos[indexx].fileUrl,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 10),
                            height: 210,
                            width: 170,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15.0)),
                              child: Image.network(
                                newVideos.newVideos[indexx].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                            ),
                            child: Text(
                              newVideos.newVideos[indexx].title,
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
                        height: 240,
                        child: ListView.builder(
                          padding: const EdgeInsets.only(left: 10),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              myViewModel.initial[index].subcategories.length,
                          itemBuilder: (BuildContext context, indexx) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>   DetailPage( id: myViewModel.initial[index].subcategories[indexx].id,),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.only(right: 10),
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
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    top: 5,
                                  ),
                                  child: Text(
                                    myViewModel.initial[index]
                                        .subcategories[indexx].title,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
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
