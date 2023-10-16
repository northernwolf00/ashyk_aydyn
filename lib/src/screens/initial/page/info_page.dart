import 'package:ashyk_aydyn_com/src/providers/file_provider.dart';
import 'package:ashyk_aydyn_com/src/providers/subcaigory_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class InfoPage extends StatefulWidget {
  final int id;
  const InfoPage({required this.id, super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  // late VideoPlayerController _controller;
  @override
  void initState() {
    fetchData();
    super.initState();
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
        iconTheme: IconThemeData(color: Colors.black),
        title: const Text(
          'AŞYK AÝDYŇ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(file.fileModel!.image)
            ],
          ),
        ),
      ),
    );
  }
}
