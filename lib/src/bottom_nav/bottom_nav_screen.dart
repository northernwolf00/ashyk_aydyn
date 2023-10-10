import 'package:ashyk_aydyn_com/src/screens/about/about.dart';
import 'package:ashyk_aydyn_com/src/screens/catigory/catigory.dart';
import 'package:ashyk_aydyn_com/src/screens/initial/initial.dart';
import 'package:ashyk_aydyn_com/src/screens/singers/singers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'bottom_nav_bar_button.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int selectedIndex = 0;

  bool isvisible = false;
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  int changer = 0;

  Future<void> checkUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? val = preferences.getString('token');

    if (val != null) {
      changer = 1;
    }
  }

  List page = [
    const Initial(),
    const Carygoryes(),
    const Singers(),
    // const AboutUs(),
  ];

  List page2 = [
    // const InitialScreen(),
    // const ExploreScreen(),
    // const AboutUs(),
    // const ProfileScreen(),
  ];

  bool appbar = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 68,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 0,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(0);
                    })),
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 1,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(1);
                    })),
            Expanded(
                child: BottomNavbarButton(
                    icon: false,
                    index: 2,
                    selectedIndex: selectedIndex,
                    onTapp: () {
                      onTapp(2);
                    })),
            // Expanded(
            //     child: BottomNavbarButton(
            //         icon: false,
            //         index: 3,
            //         selectedIndex: selectedIndex,
            //         onTapp: () {
            //           onTapp(3);
            //         })),
          ],
        ),
      ),
      // body: PersistentTabView(
      //   context,
      //   confineInSafeArea: true,
      //   screens: [
      //     Center(
      //       child: page[selectedIndex],
      //     ),
      //   ],
      //   items: [

      //   ],
      // ),
      body: IndexedStack(
        // index: selectedIndex,
        children: [
          Center(
            child: page[selectedIndex],
          ),
        ],
      ),
    );
  }

  void onTapp(int index) async {
    setState(() {
      selectedIndex = index;
    });
  }
}
