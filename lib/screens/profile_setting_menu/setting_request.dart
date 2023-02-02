import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';

class SettingRequestScreen extends StatefulWidget {
  const SettingRequestScreen({Key? key}) : super(key: key);

  @override
  State<SettingRequestScreen> createState() => _SettingRequestScreenState();
}

class _SettingRequestScreenState extends State<SettingRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: EdgeInsets.only(left: 15),
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "assets/Stroke 1.png",
                  height: 12.25,
                  color: kSecoundryColor,
                ),
                CustomText(
                  title: "Back",
                  fontSize: 14,
                  color: kSecoundryColor,
                  fontWeight: FontWeight.w500,
                ),
              ],
            ),
          ),
        ),
        title: CustomText(
          title: "Make a Request",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 15),
                child: CustomText(
                  title: "Submit",
                  color: kSecoundryColor,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ],
          )
        ],
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 21.h,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: kGreyColor, width: 2)),
                    child: Image.asset(
                      "assets/LogoCircled@3x 2.png",
                      height: 112.h,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 21.h,
            ),
            CustomText(
              title: "Suggest One or More Species",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Blue Catfish, Largemouth Bass, Brown Catfish",
              cursorColor: kBlackColor,
              hintFontSize: 18,
              fontSize: 16,
              fieldborderRadius: 5,
              textFontSize: 18,
              maxLines: 2,
              textColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Tournament Format",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Slam",
              hintFontSize: 18,
              fontSize: 16,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CustomText(
                      title: "Change",
                      fontSize: 16,
                      color: kSecoundryColor,
                    ),
                  ),
                ],
              ),
              fieldborderRadius: 5,
              textFontSize: 18,
              textColor: kBlackColor,
              cursorColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Current Home State",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Colorado",
              hintFontSize: 18,
              fontSize: 16,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CustomText(
                      title: "Change",
                      fontSize: 16,
                      color: kSecoundryColor,
                    ),
                  ),
                ],
              ),
              fieldborderRadius: 5,
              textFontSize: 18,
              textColor: kBlackColor,
              cursorColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Current Home City ",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Boulder",
              hintFontSize: 18,
              fontSize: 16,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CustomText(
                      title: "Change",
                      fontSize: 16,
                      color: kSecoundryColor,
                    ),
                  ),
                ],
              ),
              fieldborderRadius: 5,
              textFontSize: 18,
              textColor: kBlackColor,
              cursorColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Please share why this is a good tournament idea",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText:
                  "There are a lot of catfish in colorado and a slam tournament for catfish would be great. I already have 10 friends who want the same tournament.",
              hintFontSize: 18,
              fontSize: 16,
              fieldborderRadius: 5,
              textFontSize: 18,
              maxLines: 5,
              textColor: kBlackColor,
              cursorColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
      ),
    );
  }
}
