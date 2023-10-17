import 'package:ashyk_aydyn_com/src/providers/file_provider.dart';
import 'package:ashyk_aydyn_com/src/repositorys/download_repository.dart';
import 'package:ashyk_aydyn_com/src/repositorys/file_repository.dart';

import 'package:chewie/chewie.dart';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class InfoPage extends StatefulWidget {
  final int id;
  final String url;
  const InfoPage({required this.id, required this.url, super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late VideoPlayerController controller;
  ChewieController? chewieContrroller;
  final DownloadRepository useCase = DownloadRepository();

  @override
  void initState() {
    fetchData();
    loadVideo();
    super.initState();
  }

  void loadVideo() async {
    // ignore: deprecated_member_use
    controller = VideoPlayerController.network(widget.url);

    await controller.initialize();
    chewieContrroller = ChewieController(
      videoPlayerController: controller,
      autoPlay: false,
      looping: false,
    );
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    chewieContrroller?.dispose();
  }

  fetchData() async {
    // ignore: use_build_context_synchronously
    // await Provider.of<SubcatigoeyProvider>(context, listen: false)
    // .fetchSubcatigory(widget.id);
    // ignore: use_build_context_synchronously
    await Provider.of<FileProvider>(context, listen: false)
        .fetchFile(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final file = context.watch<FileProvider>();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(
          file.fileModel?.title ?? '',
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                  height: 230,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(
                      child: chewieContrroller != null &&
                              chewieContrroller!
                                  .videoPlayerController.value.isInitialized
                          ? Chewie(controller: chewieContrroller!)
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text('Ýüklenýär...')
                              ],
                            ),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.1),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 5,
                        ),
                        child: Text(
                          file.fileModel?.title ?? '',
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.cloud_download,
                                  color: Color(0xff2563EB),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Ýüklenen:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              file.fileModel?.downloaded ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.visibility,
                                  color: Color(0xff2563EB),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Görülen:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              file.fileModel?.preview.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: const [
                                Icon(
                                  Icons.sd_storage,
                                  color: Color(0xff2563EB),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Agramy:',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              file.fileModel?.size.toString() ?? '',
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'Ýazgy:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8.0, top: 8.0),
                              child: Text(
                                file.fileModel?.description.toString() ?? '',
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, top: 5, bottom: 5),
                        child: Container(
                          color: Colors.grey[300],
                          width: MediaQuery.of(context).size.width,
                          height: 1,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          useCase.fetchData(file.fileModel!.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 15.0,
                            top: 10,
                            bottom: 5
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              height: 60,
                              color: Color(0xff2563EB),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.cloud_download,
                                    color: Colors.white,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Ýükle",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
