import 'package:ashyk_aydyn_com/src/providers/subcaigory_provider.dart';
import 'package:ashyk_aydyn_com/src/screens/tabs/contact_us.dart';
import 'package:ashyk_aydyn_com/src/screens/tabs/music_collection.dart';
import 'package:ashyk_aydyn_com/src/screens/tabs/photo_collection.dart';
import 'package:ashyk_aydyn_com/src/screens/tabs/video_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DetailPage extends StatefulWidget {
  final int id;
  const DetailPage({required this.id, Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
     fetchData();
    super.initState();
  }

   fetchData() async {
    // ignore: use_build_context_synchronously
    await Provider.of<SubcatigoeyProvider>(context, listen: false)
    .fetchSubcatigory(widget.id);
    // ignore: use_build_context_synchronously
    // await Provider.of<FileProvider>(context, listen: false)
    //     .fetchFile(widget.id);
  }
  

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  int current = 0;
  @override
  Widget build(BuildContext context) {
    final subcatigoeyProvider = context.watch<SubcatigoeyProvider>();
    return Scaffold(appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          subcatigoeyProvider.subcatogoryModel?.title?? '',
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Container(
                  // height: 50,
                  width: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TabBar(
                          unselectedLabelColor: Colors.blue,
                          labelColor: Colors.white,
                          indicatorColor: Colors.blue,
                          indicatorWeight: 3,
                          indicator: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          controller: tabController,
                          isScrollable: true,
                          tabs: const [
                            Tab(
                              child: Text(
                                'Aýdymlar',
                                style: TextStyle(
                                    fontFamily: "BarlowBold", fontSize: 14),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Klipler',
                                style: TextStyle(
                                    fontFamily: "BarlowBold", fontSize: 14),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Suratlar',
                                style: TextStyle(
                                    fontFamily: "BarlowBold", fontSize: 14),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Toý dabaralar üçin',
                                style: TextStyle(
                                    fontFamily: "BarlowBold", fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: tabController,
                    children: const [
                      MusicCollection(),
                      VideoCollection(),
                      PhotoCollection(),
                      ContactUs(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
