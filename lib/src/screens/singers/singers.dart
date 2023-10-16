import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/intial_provider.dart';

class Singers extends StatefulWidget {
  const Singers({super.key});

  @override
  State<Singers> createState() => _SingersState();
}

class _SingersState extends State<Singers> {
  @override
  Widget build(BuildContext context) {
    final myViewModel = context.watch<InitialProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bagşylar',
          style: TextStyle(color: Colors.black),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        backgroundColor: Colors.white,
        elevation: 3,
      ),
      body: SafeArea(
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 10, right: 10, top: 8),
          itemCount: myViewModel.initial[0].subcategories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // number of items in each row
            crossAxisSpacing: 2.0,
            mainAxisSpacing: 8.0,
          ),
          itemBuilder: (BuildContext context, index) {
            return Container(
              width: 170,
              padding: const EdgeInsets.only(left: 10,),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  myViewModel.initial[0].subcategories[index].icon,
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
