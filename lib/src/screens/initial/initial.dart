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
    // final myViewModel = context.watch<InitialProvider>();
    // final newVideos = context.watch<NewVideosProvider>();
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: ListView.builder(
                  shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)),
                      width: 100,
                      child: index == 7 ? Icon(Icons.abc) : Text('data'),
                    );
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
