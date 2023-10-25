import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../../providers/subcaigory_provider.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    final subcatigoeyProvider = context.watch<SubcatigoeyProvider>();
    return Scaffold(
      body: Card(
        child: ClipRRect(
          child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      subcatigoeyProvider.subcatogoryModel?.description ?? '',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
