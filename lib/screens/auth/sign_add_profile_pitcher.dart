import 'dart:io';

import 'package:app/screens/auth/sign_up_choose_favourite.dart';
import 'package:app/screens/auth/sign_up_verify_email.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../widget/custom_button.dart';

class SignAddProfilePitcher extends StatefulWidget {
  SignAddProfilePitcher({
    this.firstN,
    this.lastN,
    this.state,
    this.city,
    this.dob,
    this.gender,
  });

  final firstN;
  final lastN;
  final state;
  final city;
  final dob;
  final gender;

  @override
  State<SignAddProfilePitcher> createState() => _SignAddProfilePitcherState();
}

class _SignAddProfilePitcherState extends State<SignAddProfilePitcher> {
  File? _image;

  Future getImage() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image!.path);
    });
  }

  Future getCamera() async {
    PickedFile? image =
        await ImagePicker().getImage(source: ImageSource.camera);
    setState(() {
      _image = File(image!.path);
    });
  }

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
      body: Container(
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
              title: "Lets add a profile picture",
              color: kGreyDarkColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 40.h,
            ),
            Column(
              children: [
                _image == null
                    ? GestureDetector(
                        onTap: () {
                          getImage();
                        },
                        child: Container(
                          height: 200.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: kSecoundryColor),
                          child: Center(
                              child: Image.asset(
                            "assets/Group 6.png",
                            height: 120.h,
                          )),
                        ),
                      )
                    : Container(
                        height: 200.h,
                        width: 200.w,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            _image!,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ],
            ),
            SizedBox(
              height: 70.h,
            ),
            _image == null
                ? CustomButton(
                    onPressed: () {
                      getImage();
                    },
                    title: "Choose Photo",
                    btnColor: kSecoundryColor,
                    textColor: kMainColor,
                    btnHeight: 46.h,
                    btnRadius: 25,
                  )
                : CustomButton(
                    onPressed: () async {
                        setState(() {
                          isLoading = true;
                        });
                        await FirebaseAuth.instance.currentUser?.sendEmailVerification();
                        await AuthServices.upDateSignUp(
                          firstN: UserModel.userModel.firstN,
                          lastN: UserModel.userModel.lastN,
                          city: UserModel.userModel.city,
                          state: UserModel.userModel.state,
                          gender: UserModel.userModel.gender,
                          subscriptionType: "",
                          dob: UserModel.userModel.dob,
                          favourite: [],
                          image: _image,
                        );
                        setState(() {
                          isLoading = false;
                        });
                       UserModel.userModel.isVerified==false? Helper.toRemoveUntiScreen(context, SignUpVerifyEmail()) :Helper.toRemoveUntiScreen(context, SignUpChooseFavourite());
                        Helper.showSnack(
                            context, "Profile Updated Successfully");

                      }

                    // onPressed: () async {
                    //   if (_image != null) {
                    //     await AuthServices.upDateSignUp(
                    //       firstN: UserModel.userModel.firstN,
                    //       lastN: UserModel.userModel.lastN,
                    //       city: UserModel.userModel.city,
                    //       state: UserModel.userModel.state,
                    //       gender: UserModel().gender,
                    //       subscriptionType: "",
                    //       dob: UserModel.userModel.dob,
                    //       favourite: [],
                    //       image: _image,
                    //     ).whenComplete(() =>
                    //         Helper.toScreen(context, SignAddProfilePitcher()));
                    //   } else {
                    //     Helper.showSnack(context, "Kindly Select Profile Image");
                    //   }
                    // },
  ,
                    title: isLoading ? "Uploading" : "Save",
                    btnColor: kSecoundryColor,
                    textColor: kMainColor,
                    btnHeight: 46.h,
                    btnRadius: 25,
                  ),
            SizedBox(
              height: 20.h,
            ),
            _image == null
                ? CustomButton(
                    onPressed: () {
                      getCamera();
                    },
                    title: "Open Camera",
                    btnColor: kMainColor,
                    btnBorderColor: kSecoundryColor,
                    textColor: kSecoundryColor,
                    btnHeight: 46.h,
                    btnRadius: 25,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
