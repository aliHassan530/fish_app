import 'dart:ui';

import 'package:app/screens/leader_board/leader_board_weekly.dart';
import 'package:app/screens/profile/profile.dart';
import 'package:app/screens/tournment/tournment_hub_elimation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';
import '../home/home.dart';
import '../image_capture/instruction.dart';

class BottomBar extends StatefulWidget {
  // BottomBar({
  //   required this.val,
  // });
  //
  // final int val;

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  List iconList = [
    HomeScreen(),
    TournmentHubelimation(),
    InstructionScreen(),
    LeaderBoardWeekly(),
    ProfileScreen(),
  ];

  late int currentindex = 0;

  start() {
    setState(() {
      currentindex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(systemNavigationBarColor: kMainColor),
      child: Scaffold(
        extendBody: false,
        backgroundColor: kMainColor,
        resizeToAvoidBottomInset: false,
        body: iconList[currentindex],
        bottomNavigationBar: BottomAppBar(
          elevation: 15,
          color: Colors.transparent,
          shape: const CircularNotchedRectangle(),
          clipBehavior: Clip.antiAlias,
          notchMargin: 5.0,
          child: Container(
            height: 75,
            child: ClipRRect(
              child: BottomNavigationBar(
                backgroundColor: kMainColor,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: currentindex,
                onTap: (index) {
                  setState(() {
                    currentindex = index;
                    print(currentindex);
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/Vector (56).png",
                          height: 21,
                          color: currentindex == 0
                              ? kSecoundryColor
                              :kBottomBarGreyColor,
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/trophy.png",
                          height: 21,
                          color: currentindex == 1
                              ? kSecoundryColor
                              :kBottomBarGreyColor,
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/plus-square.png",
                          height: 21,
                          color: currentindex == 2
                              ? kSecoundryColor
                              :kBottomBarGreyColor,
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      children: [
                        Image.asset(
                          "assets/Vector (57).png",
                          height: 21,
                          color: currentindex == 3
                              ? kSecoundryColor
                              :kBottomBarGreyColor,
                        ),
                      ],
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Column(
                      children: [
                        Image.asset(
                          "assets/user (4) 1.png",
                          height: 21,
                          color: currentindex == 4
                              ? kSecoundryColor
                              :kBottomBarGreyColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
