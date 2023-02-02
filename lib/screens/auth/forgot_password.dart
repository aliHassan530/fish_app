import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_button.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _conditons = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
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
              SizedBox(
                height: 15.h,
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
                height: 15.h,
              ),
              CustomText(
                title: "Forgot Password",
                fontSize: 28,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.center,
                color: kSecoundryColor,
              ),
              SizedBox(height: 10.h),
              CustomText(
                title: "Welcome back to the action!",
                color: kGreyDarkColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                child: CustomTextField(
                  controller: emailController,
                  cursorColor: kGreyLightColor,
                  hintText: "Forgot Password",
                  hintFontSize: 16,
                  fontSize: 16,
                  validation: (val) {
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    if (val!.isEmpty) {
                      return "Invalid Email";
                    } else if (val.isNotEmpty) {
                      if (!regExp.hasMatch(val)) {
                        return "Invalid Email";
                      }
                    }
                    return null;
                  },
                  textFontSize: 16,
                  textColor: kGreyLightColor,
                  hintTextColor: kGreyLightColor,
                  isOutlineInputBorder: true,
                  isOutlineInputBorderColor: kSecoundryColor,
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Column(
                children: [
                  CustomButton(
                    onPressed: () async {
                      if (emailController.text.isNotEmpty) {
                        provider.changeIsLoading(true);

                        var result = await AuthServices.resetPassword(
                          email: emailController.text,
                        );

                        if (result == "Success") {
                          provider.changeIsLoading(false);
                          Helper.showSnack(context, "Password Link Sent");
                        } else {
                          provider.changeIsLoading(false);
                          Helper.showSnack(context, result.toString());
                        }
                      } else {
                        Helper.showSnack(context,
                            "Please fill the email field to reset your password");
                      }
                    },
                    btnWidth: MediaQuery.of(context).size.width * 0.7,
                    title: "Forgot Password",
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    btnRadius: 100,
                    textColor: kMainColor,
                    btnColor: kSecoundryColor,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
