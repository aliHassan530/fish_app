import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';

class FeatureRequestTab extends StatefulWidget {
  const FeatureRequestTab({Key? key}) : super(key: key);

  @override
  State<FeatureRequestTab> createState() => _FeatureRequestTabState();
}

class _FeatureRequestTabState extends State<FeatureRequestTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
          SizedBox(
            height: 24.h,
          ),
          CustomText(
            title: "Please share your thoughts",
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
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            hintFontSize: 14,
            fontSize: 16,
            maxLines: 10,
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
            title: "Contact Email",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kGreyDarkColor,
            maxLines: 1,
          ),
          SizedBox(
            height: 9.h,
          ),
          CustomInputField(
            hintText: "thomasfuel@gmail.com",
            hintFontSize: 14,
            fontSize: 16,
            fieldborderRadius: 5,
            textFontSize: 18,
            textColor: kBlackColor,
            cursorColor: kBlackColor,
            hintTextColor: kBlackColor,
            isOutlineInputBorder: true,
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
            isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
          ),
          SizedBox(
            height: 28.h,
          ),
          CustomText(
            title: "Lets Talk! ",
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: kBlackColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            title: "We want to hear from you! Follow us!",
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kBlackColor,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: kGreyColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                    child: Image.asset(
                  "assets/meetrr-insta-icon@3x 1.png",
                  height: 24,
                )),
              ),
              SizedBox(
                width: 50.w,
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: kGreyColor.withOpacity(0.3)),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                    child: Image.asset(
                  "assets/meetrr-fb-icon@3x 1.png",
                  height: 24,
                )),
              ),
            ],
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}
