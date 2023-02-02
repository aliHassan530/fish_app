import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_input_field.dart';
import '../../widget/custom_text.dart';

class SettingAccountInformation extends StatefulWidget {
  const SettingAccountInformation({Key? key}) : super(key: key);

  @override
  State<SettingAccountInformation> createState() =>
      _SettingAccountInformationState();
}

class _SettingAccountInformationState extends State<SettingAccountInformation> {
  File? _image;

  Future getImage() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

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
          title: "Account Information",
          fontWeight: FontWeight.w700,
          fontSize: 18,
          color: kBlackColor,
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Column(
              children: [
                _image == null
                    ? Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/Rectangle 2600 (3).png",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    : Container(
                        height: 100,
                        width: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                SizedBox(
                  height: 8.h,
                ),
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: CustomText(
                    title: "Change Photo",
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: kGreyDarkColor,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            CustomText(
              title: "Full Name",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Thomas Fuel",
              cursorColor: kBlackColor,
              hintFontSize: 18,
              fontSize: 16,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(
                    title: "Edit",
                    fontSize: 16,
                    color: kSecoundryColor,
                  ),
                ],
              ),
              fieldborderRadius: 5,
              textFontSize: 18,
              textColor: kBlackColor,
              hintTextColor: kBlackColor,
              isOutlineInputBorder: true,
              isOutlineInputBorderColor: kGreyLightColor.withOpacity(0.3),
            ),
            SizedBox(
              height: 24.h,
            ),
            CustomText(
              title: "Email",
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
              title: "Current Home State ",
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
              textFontSize: 18,
              textColor: kBlackColor,
              cursorColor: kBlackColor,
              hintTextColor: kBlackColor,
              fieldborderRadius: 5,
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
              title: "Membership",
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: kGreyDarkColor,
              maxLines: 1,
            ),
            SizedBox(
              height: 9.h,
            ),
            CustomInputField(
              hintText: "Manage Subscription",
              hintFontSize: 18,
              fontSize: 16,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: CustomText(
                      title: "Manage",
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
          ],
        ),
      ),
    );
  }
}
