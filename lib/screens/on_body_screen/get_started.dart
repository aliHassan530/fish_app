import 'package:app/screens/on_body_screen/onbody_screen.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_button.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            // height: 449.h,
            child: Image.asset(
              "assets/FreshwaterSlam 1.png",
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: kGreyColor)),
                child: Image.asset(
                  "assets/LogoCircled@3x 2.png",
                  height: 60.h,
                ),
              ),
              SizedBox(
                height: 18.h,
              ),
              CustomText(
                title: "Fish Masters Live",
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: kBlackColor,
              ),
              SizedBox(
                height: 11.h,
              ),
              CustomText(
                title: "The utlimate online fishing tournament\n experience",
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: kGreyColor,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 46.h,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: CustomButton(
              title: "Get Started",
              onPressed: () {
                Helper.toScreen(context, OnBodyScreen());
              },
              btnColor: kSecoundryColor,
              textColor: kMainColor,
              btnHeight: 46.h,
              btnRadius: 25,
            ),
          )
        ],
      ),
    );
  }
}
