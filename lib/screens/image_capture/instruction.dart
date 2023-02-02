import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widget/custom_button.dart';
import 'capture_image.dart';

class InstructionScreen extends StatefulWidget {
  const InstructionScreen({Key? key}) : super(key: key);

  @override
  State<InstructionScreen> createState() => _InstructionScreenState();
}

class _InstructionScreenState extends State<InstructionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBlackColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "To start logging:",
              fontWeight: FontWeight.w700,
              fontSize: 22,
              color: kMainColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomText(
              title: "1. Lay fish flat on ground",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: kMainColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title: "2. Keep phone 4-5 feet back from surface ",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: kMainColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title:
                  "2. Scan the ground with camera 2-3 feet in each direction around the fish. ",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: kMainColor,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15.h,
            ),
            CustomText(
              title:
                  "2. Once surface area is detected, fill box with fish and capture the image",
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: kMainColor,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 100.h,
        color: Colors.transparent,
        child: Column(
          children: [
            CustomButton(
              btnHeight: 45.h,
              btnRadius: 100,
              onPressed: () {
                Helper.toScreen(context, CaptureImageScreen());
              },
              title: "Start Logging",
              textColor: kMainColor,
              btnColor: kSecoundryColor,
            ),
          ],
        ),
      ),
    );
  }
}
