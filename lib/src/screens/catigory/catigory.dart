import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/intial_provider.dart';

class Carygoryes extends StatefulWidget {
  const Carygoryes({super.key});

  @override
  State<Carygoryes> createState() => _CarygoryesState();
}

class _CarygoryesState extends State<Carygoryes> {
  @override
  Widget build(BuildContext context) {
    final myViewModel = context.watch<InitialProvider>();
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
        child: GridView.builder(
          padding: const EdgeInsets.only(bottom: 10, right: 10, top: 8),
          itemCount: myViewModel.initial.length,
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
                child: Image.network(
                  myViewModel.initial[index].icon,
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
