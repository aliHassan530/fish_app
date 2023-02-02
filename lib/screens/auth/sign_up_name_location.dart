import 'package:app/screens/auth/sign_up_gender_and_birthday.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../widget/custom_text_image_button.dart';
import '../../widget/custom_textfield.dart';

class SignUpNameLocation extends StatefulWidget {
  const SignUpNameLocation({Key? key}) : super(key: key);

  @override
  State<SignUpNameLocation> createState() => _SignUpNameLocationState();
}

class _SignUpNameLocationState extends State<SignUpNameLocation> {
  TextEditingController fistName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController state = TextEditingController();
  final GlobalKey<FormState> _conditons = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: kMainColor,
        elevation: 0,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.only(top: 25, left: 15),
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: kSecoundryColor,
                ),
                child: Center(
                  child: Image.asset(
                    "assets/arrow 2 (1).png",
                    height: 12.83,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Form(
        key: _conditons,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(
                height: 56.h,
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
              SizedBox(
                height: 25.h,
              ),
              Center(
                child: Image.asset(
                  "assets/Setup Account.png",
                  height: 36,
                  width: 250,
                ),
              ),
              SizedBox(height: 21.h),
              CustomText(
                title: "Lets hear a bit about you!",
                color: kGreyDarkColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                child: CustomTextField(
                  controller: fistName,
                  cursorColor: kGreyLightColor,
                  hintText: "First Name",
                  validation: (val) =>
                      val!.isEmpty ? "First Name required" : null,
                  hintFontSize: 16,
                  fontSize: 16,
                  textFontSize: 16,
                  textColor: kGreyLightColor,
                  hintTextColor: kGreyLightColor,
                  isOutlineInputBorder: true,
                  isOutlineInputBorderColor: kSecoundryColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                child: CustomTextField(
                  controller: lastName,
                  cursorColor: kGreyLightColor,
                  hintText: "Last Name",
                  validation: (val) =>
                      val!.isEmpty ? "Last Name required" : null,
                  hintFontSize: 16,
                  fontSize: 16,
                  textFontSize: 16,
                  textColor: kGreyLightColor,
                  hintTextColor: kGreyLightColor,
                  isOutlineInputBorder: true,
                  isOutlineInputBorderColor: kSecoundryColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Container(
                child: CustomTextField(
                  controller: city,
                  cursorColor: kGreyLightColor,
                  hintText: "City",
                  validation: (val) => val!.isEmpty ? "City required" : null,
                  hintFontSize: 16,
                  fontSize: 16,
                  textFontSize: 16,
                  textColor: kGreyLightColor,
                  hintTextColor: kGreyLightColor,
                  isOutlineInputBorder: true,
                  isOutlineInputBorderColor: kSecoundryColor,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: state,
                cursorColor: kGreyLightColor,
                hintText: "State",
                validation: (val) => val!.isEmpty ? "State required" : null,
                hintFontSize: 16,
                fontSize: 16,
                textFontSize: 16,
                textColor: kGreyLightColor,
                hintTextColor: kGreyLightColor,
                isOutlineInputBorder: true,
                isOutlineInputBorderColor: kSecoundryColor,
              ),
              SizedBox(
                height: 27.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextImageButton(
                    txt: "Next",
                    onTap: () async {
                      if (_conditons.currentState!.validate()) {
                        provider.changeIsLoading(true);
                        await AuthServices.upDateSignUp(
                          firstN: fistName.text,
                          lastN: lastName.text,
                          city: city.text,
                          state: state.text,
                          gender: "",
                          subscriptionType: "",
                          dob: DateTime(2),
                          favourite: [],
                          // image: null,
                          profilePrivacy: false,
                          // image: null,
                        );
                        provider.changeIsLoading(false);
                        Helper.toRemoveUntiScreen(
                            context, SignUpGenderAndBirthDay());
                        Helper.showSnack(
                            context, "Profile Updated Successfully!!!");
                      } else {
                        Helper.showSnack(
                          context,
                          "Please fill all the fields to continue",
                        );
                      }
                    },
                    // onTap: () async {
                    //   if (_conditons.currentState!.validate()) {
                    //     await AuthServices.upDateSignUp(
                    //       firstN: fistName.text,
                    //       lastN: lastName.text,
                    //       city: city.text,
                    //       state: state.text,
                    //       gender: "",
                    //       subscriptionType: "",
                    //       dob: null,
                    //       favourite: [],
                    //       image:null,
                    //     )
                    //         .whenComplete(() => Helper.toScreen(
                    //         context, SignUpGenderAndBirthDay()));
                    //   }
                    // },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
