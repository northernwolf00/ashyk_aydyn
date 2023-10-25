import 'package:flutter/material.dart';

Widget ButtonTvChanalTab(String title) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, right: 4),
    child: SizedBox(
        height: 45,
        width: 120,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.black),
          ),
        )),
  );
}