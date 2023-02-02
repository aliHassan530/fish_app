import 'package:app/screens/auth/sign_add_profile_pitcher.dart';
import 'package:app/screens/auth/sign_up_choose_favourite.dart';
import 'package:app/screens/auth/sign_up_gender_and_birthday.dart';
import 'package:app/screens/auth/sign_up_name_location.dart';
import 'package:app/screens/auth/sign_up_subcription_offer.dart';
import 'package:app/screens/auth/sign_up_verify_email.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_text_image_button.dart';
import '../../widget/custom_textfield.dart';
import '../bottom_bar/bottom_bar.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
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
                  SizedBox(
                    height: 42.h,
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
                height: 25.h,
              ),
              Image.asset(
                "assets/Login.png",
                height: 36,
              ),
              SizedBox(height: 21.h),
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
                  hintText: "Email address",
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
                  controller: passwordController,
                  cursorColor: kGreyLightColor,
                  hintText: "Password",
                  hintFontSize: 16,
                  fontSize: 16,
                  obscureText: true,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Helper.toScreen(context, ForgotPasswordScreen());
                    },
                    child: CustomText(
                      title: "Forgot Password?",
                      color: kGreyDarkColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  CustomTextImageButton(
                    txt: isLoading ? "Processing" : "Lets Go",
                    onTap: () async {
                      try {
                        if (_conditons.currentState!.validate()) {
                          // it validates if every field is filled
                          setState(() {
                            isLoading = true;
                          });
                          // then we need to perform the firebase call to check the valifity of user
                          var result = await AuthServices.signIn(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                          // if user is already in the firebase we need to sign in and take it to the main page
                          if (result == "Success") {
                            User? user = FirebaseAuth.instance.currentUser;
                            var userDetails =
                                await AuthServices.getUserDetails(user!.uid);

                            await AuthServices.setCurrentUserToMap(user.uid);
                            setState(() {
                              isLoading = false;
                            });

                            Helper.showSnack(context, "Logged In Successfully");
                            if (UserModel.userModel.firstN == "") {
                              Helper.toReplacementScreen(
                                  context, SignUpNameLocation());
                            } else if (UserModel().gender == "") {
                              Helper.toReplacementScreen(
                                  context, SignUpGenderAndBirthDay());
                            } else if (UserModel().image == "") {
                              Helper.toReplacementScreen(
                                  context, SignAddProfilePitcher());
                            } else if (UserModel.userModel.isVerified != true) {
                              print(UserModel().image);
                              Helper.toReplacementScreen(
                                  context, SignUpVerifyEmail());
                            } else if (UserModel.userModel.favourite == "") {
                              Helper.toReplacementScreen(
                                  context, SignUpChooseFavourite());
                            } else if (UserModel.userModel.subscriptionType ==
                                "") {
                              Helper.toReplacementScreen(
                                  context, SignUpSubcriptionOffer());
                            } else {
                              Helper.toReplacementScreen(context, BottomBar());
                            }

                            // Helper.toRemoveUntiScreen(
                            //     context, MainTabBar());
                            // if (
                            // UserModel().firstN == "" ||
                            //     UserModel().gender == "" ||
                            //     UserModel().subscriptionType == ""
                            // ) {
                            //   Helper.toReplacementScreen(
                            //       context, SignUpNameLocation());
                            // }

                            // else {
                            //   Helper.toReplacementScreen(context, BottomBar());
                            // }
                          } else {
                            // otherwise we need to show an error that email or password is incorrect
                            setState(() {
                              isLoading = false;
                            });
                            Helper.showSnack(
                                context, "Email or Password is incorrect");
                          }
                        } else {
                          Helper.showSnack(context,
                              "Please fill all the fields to continue");
                        }
                      } catch (e) {
                        setState(() {
                          isLoading = false;
                        });
                        Helper.showSnack(context, "Something went wrong");
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomText(
                title: "or login with",
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
                  GestureDetector(
                    onTap: () async {
                      try {
                        provider.changeIsLoading(true);
                        var res = await AuthServices.signInWithApple();
                        if (res == "ACCreated") {
                          User? user = FirebaseAuth.instance.currentUser;

                          await AuthServices.setCurrentUserToMap(user!.uid);
                          provider.changeIsLoading(false);
                          Helper.toRemoveUntiScreen(context, BottomBar());
                          Helper.showSnack(
                              context, "Account Created Successfully");
                        } else if (res == "LoggedIn") {
                          User? user = FirebaseAuth.instance.currentUser;

                          await AuthServices.setCurrentUserToMap(user!.uid);
                          provider.changeIsLoading(false);
                          if (UserModel.userModel.firstN == "") {
                            Helper.toReplacementScreen(
                                context, SignUpNameLocation());
                          } else if (UserModel().gender == "") {
                            Helper.toReplacementScreen(
                                context, SignUpGenderAndBirthDay());
                          } else if (UserModel().image == "") {
                            Helper.toReplacementScreen(
                                context, SignAddProfilePitcher());
                          } else if (UserModel.userModel.isVerified != true) {
                            print(UserModel().image);
                            Helper.toReplacementScreen(
                                context, SignUpVerifyEmail());
                          } else if (UserModel.userModel.favourite == "") {
                            Helper.toReplacementScreen(
                                context, SignUpChooseFavourite());
                          } else if (UserModel.userModel.subscriptionType ==
                              "") {
                            Helper.toReplacementScreen(
                                context, SignUpSubcriptionOffer());
                          } else {
                            Helper.toReplacementScreen(context, BottomBar());
                          }
                          Helper.showSnack(context, "Logged In Successfully");
                        } else {
                          Helper.showSnack(context, res);
                          provider.changeIsLoading(false);
                        }
                      } catch (e) {
                        provider.changeIsLoading(false);
                        Helper.showSnack(
                          context,
                          "Something Went Wrong",
                        );
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
                            "assets/apple_logo 1.png",
                            height: 20.h,
                          ),
                        ],
                      ),
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
                          if (UserModel.userModel.firstN == "") {
                            Helper.toReplacementScreen(
                                context, SignUpNameLocation());
                          } else if (UserModel().gender == "") {
                            Helper.toReplacementScreen(
                                context, SignUpGenderAndBirthDay());
                          } else if (UserModel().image == "") {
                            Helper.toReplacementScreen(
                                context, SignAddProfilePitcher());
                          } else if (UserModel.userModel.isVerified != true) {
                            print(UserModel().image);
                            Helper.toReplacementScreen(
                                context, SignUpVerifyEmail());
                          } else if (UserModel.userModel.favourite == "") {
                            Helper.toReplacementScreen(
                                context, SignUpChooseFavourite());
                          } else if (UserModel.userModel.subscriptionType ==
                              "") {
                            Helper.toReplacementScreen(
                                context, SignUpSubcriptionOffer());
                          } else {
                            Helper.toReplacementScreen(context, BottomBar());
                          }
                          // Helper.toRemoveUntiScreen(context, BottomBar());
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
