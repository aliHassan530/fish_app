import 'package:app/screens/auth/sign_up_name_location.dart';
import 'package:app/screens/bottom_bar/bottom_bar.dart';
import 'package:app/utilites/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_button.dart';
import '../../widget/custom_text.dart';
import '../../widget/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  final GlobalKey<FormState> _conditons = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  "assets/Create Account.png",
                  height: 36,
                  width: 250,
                ),
              ),
              SizedBox(height: 21.h),
              CustomText(
                title: "An email will be sent to your inbox for verification ",
                color: kGreyDarkColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 40.h,
              ),
              Container(
                child: CustomTextField(
                  controller: email,
                  cursorColor: kGreyLightColor,
                  hintText: "Email address",
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
                height: 16.h,
              ),
              CustomTextField(
                controller: password,
                cursorColor: kGreyLightColor,
                hintText: "Password",
                hintFontSize: 16,
                fontSize: 16,
                obscureText: true,
                validation: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (val.length < 8) {
                    return "Please enter a password between 8-15 characters";
                  } else {
                    return null;
                  }
                },
                textFontSize: 16,
                textColor: kGreyLightColor,
                hintTextColor: kGreyLightColor,
                isOutlineInputBorder: true,
                isOutlineInputBorderColor: kSecoundryColor,
              ),
              SizedBox(
                height: 16.h,
              ),
              CustomTextField(
                controller: confirmPassword,
                cursorColor: kGreyLightColor,
                hintText: "Confirm Password",
                hintFontSize: 16,
                fontSize: 16,
                validation: (val) {
                  if (val!.isEmpty) {
                    return 'This field is required';
                  } else if (val.length < 8) {
                    return "Please enter a password between 8-15 characters";
                  } else {
                    return null;
                  }
                },
                obscureText: true,
                textFontSize: 16,
                textColor: kGreyLightColor,
                hintTextColor: kGreyLightColor,
                isOutlineInputBorder: true,
                isOutlineInputBorderColor: kSecoundryColor,
              ),
              SizedBox(
                height: 36.h,
              ),
              CustomButton(
                onPressed: () async {
                  try {
                    if (_conditons.currentState!.validate()) {
                      if (password.text == confirmPassword.text) {
                        // provider.changeIsLoading(true);
                        setState(() {
                          isLoading = true;
                        });
                        // if everthing is good we need to register the user into firebase
                        var result = await AuthServices.signUp(
                          email: email.text,
                          password: password.text,
                        );
                        if (result == "Success") {
                          // if user is registered successfully then we need to take the user to main page
                          User? user = FirebaseAuth.instance.currentUser;
                          await Helper.showSnack(
                              context, "Account Created Successfully!");
                          Helper.toRemoveUntiScreen(
                              context, SignUpNameLocation());
                        } else {
                          setState(() {
                            isLoading = false;
                          });
                          // provider.changeIsLoading(false);
                          Helper.showSnack(context, result);
                        }
                      } else {
                        Helper.showSnack(context, "Passwords don't match");
                      }
                    } else {
                      Helper.showSnack(
                          context, "Please fill all the fields to continue");
                    }
                  } catch (e) {
                    setState(() {
                      isLoading = false;
                    });
                    // provider.changeIsLoading(false);
                    Helper.showSnack(context, "Something went wrong");
                  }
                },
                // onPressed: () async {
                // //   try {
                // //     if (_conditons.currentState!.validate())
                // //
                // //      // ignore: curly_braces_in_flow_control_structures
                // //      if (password
                // //             .text ==
                // //         confirmPassword.text) {
                // //       {
                // //         print("----------------------------------------");
                // //         setState(() {
                // //           isLoading = true;
                // //         });
                // //         await AuthServices.auth.currentUser!
                // //             .sendEmailVerification();
                // //         var res = await AuthServices.signUp(
                // //           email: email.text,
                // //           password: password.text,
                // //         );
                // //         // ).whenComplete(() =>
                // //         //     Helper.toScreen(context, SignUpNameLocation()));
                // //         if (res == "Success") {
                // //           Helper.toScreen(context, SignUpNameLocation());
                // //         } else {
                // //           Helper.showSnack(context, res);
                // //         }
                // //       }
                // //     } else {
                // //       Helper.showSnack(context, "Passwords don't match");
                // //     }
                // //   } catch (e) {
                // //     showDialog(
                // //       context: context,
                // //       builder: (BuildContext context) {
                // //         return AlertDialog(
                // //           title: Text("Error"),
                // //           content: Text("Something Wrong"),
                // //           actions: [
                // //             InkWell(
                // //               child: Text("Ok"),
                // //               onTap: () {
                // //                 Navigator.of(context).pop();
                // //               },
                // //             )
                // //           ],
                // //         );
                // //       },
                // //     );
                // //   }
                // //
                // //   // await  FirebaseAuth.instance.createUserWithEmailAndPassword(
                // //   //       email: email.text, password: password.text);
                // //   print("Create");
                // // },
                title: isLoading ? "Processing" : "Create Account",
                btnColor: kSecoundryColor,
                textColor: kMainColor,
                btnHeight: 46.h,
                btnRadius: 25,
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                title: "or\ncreate account with",
                color: kGreyDarkColor,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 30.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 42,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21),
                      color: kSecoundryColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/apple_logo 1.png",
                          height: 20.h,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      try {
                        provider.changeIsLoading(true);
                        var res = await AuthServices.signInWithGoogle();
                        if (res == "ACCreated") {
                          User? user = FirebaseAuth.instance.currentUser;
                          await AuthServices.setCurrentUserToMap(user!.uid);
                          provider.changeIsLoading(false);
                          Helper.toRemoveUntiScreen(
                              context, SignUpNameLocation());
                          Helper.showSnack(
                              context, "Account Created Successfully");
                        } else if (res == "LoggedIn") {
                          User? user = FirebaseAuth.instance.currentUser;
                          await AuthServices.setCurrentUserToMap(user!.uid);
                          provider.changeIsLoading(false);
                          Helper.toRemoveUntiScreen(context, BottomBar());
                          Helper.showSnack(context, "Logged In Successfully");
                        } else {
                          Helper.showSnack(context, res);
                          provider.changeIsLoading(false);
                        }
                      } catch (e) {
                        provider.changeIsLoading(false);
                        Helper.showSnack(context, "Something Went Wrong");
                        print(e);
                      }
                    },
                    child: Container(
                      height: 42,
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: kSecoundryColor,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/google_logo 1.png",
                            height: 20.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: kMainColor,
        child: GestureDetector(
          onTap: () {
            // Helper.toScreen(context, SignUp());
          },
          child: Container(
            height: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                  title: "By creating an account you agree to our",
                  fontSize: 13,
                  color: kBlackColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: kBlackColor.withOpacity(0.4),
                        ),
                      )),
                      child: Text(
                        " Privacy Policy",
                        style: TextStyle(
                          fontSize: 13,
                          color: kBlackColor.withOpacity(0.4),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    CustomText(
                      title: "  and ",
                      color: kBlackColor,
                    ),
                    Container(
                      padding: EdgeInsets.only(bottom: 2),
                      decoration: BoxDecoration(
                          border: Border(
                        bottom: BorderSide(
                          color: kBlackColor.withOpacity(0.4),
                        ),
                      )),
                      child: Row(
                        children: [
                          Text(
                            "Terms",
                            style: TextStyle(
                              fontSize: 13,
                              color: kSecoundryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            " and Conditions",
                            style: TextStyle(
                              fontSize: 13,
                              color: kBlackColor.withOpacity(0.4),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
