import 'package:app/model/user_model.dart';
import 'package:app/screens/auth/sign_add_profile_pitcher.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/main_provider.dart';
import '../../services/auth_services.dart';
import '../../widget/custom_text_image_button.dart';

class SignUpGenderAndBirthDay extends StatefulWidget {
  @override
  State<SignUpGenderAndBirthDay> createState() =>
      _SignUpGenderAndBirthDayState();
}

class _SignUpGenderAndBirthDayState extends State<SignUpGenderAndBirthDay> {
  DateTime? selectedDate;
  String? age;

  String? valueChoice;
  List _selection = [
    "Male",
    "Female",
  ];

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        builder: (BuildContext? context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(
                primary: kSecoundryColor,
                surface: kMainColor,
                onSurface: Colors.black,
              ),

              // dialogBackgroundColor: Colors.blue[900],
            ),
            child: child!,
          );
        },
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1800),
        lastDate: DateTime(2500));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        // var formattedDate = DateFormat('MM-dd-yyyy').format(selectedDate);
        // dateSelected = formattedDate;

        age = (DateTime.now().difference(selectedDate!).inDays / 365)
            .toInt()
            .toString();
      });
      print(age);
    }
  }

  bool isSwitched = false;
  final GlobalKey<FormState> _conditons = GlobalKey<FormState>();

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
                title: "Please enter Date of Birth and Gender",
                color: kGreyDarkColor,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () => selectDate(context),
                child: Container(
                  // decoration: BoxDecoration(
                  //   borderRadius: BorderRadius.circular(25),
                  //   border: Border.all(color: kSecoundryColor),

                  child: TextFormField(
                    style: const TextStyle(
                      color: kGreyLightColor,
                      fontSize: 16,
                    ),
                    decoration: InputDecoration(
                      // errorStyle: TextStyle(color: kRedColor),
                      contentPadding: EdgeInsets.only(left: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: kSecoundryColor, width: 2),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: kSecoundryColor, width: 2),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide:
                            BorderSide(color: kSecoundryColor, width: 2),
                      ),

                      hintText: selectedDate == null
                          ? "Date of Birth"
                          : DateFormat('MM - dd - yyyy').format(selectedDate!),
                      hintStyle: const TextStyle(
                        color: kGreyLightColor,
                        fontSize: 16,
                      ),
                      enabled: false,
                    ),

                    validator: (val) => val!.isEmpty ? "required" : null,
                    // borderRadius: 10,
                  ),
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                    border: Border.all(color: kSecoundryColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(25)),
                child: DropdownButton(
                  elevation: 0,
                  itemHeight: 65,
                  underline: Container(
                    height: 1.0,
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.transparent, width: 0.0))),
                  ),
                  hint: Container(
                      margin: EdgeInsets.only(left: 15),
                      child: Text(
                        "Gender",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: kGreyLightColor),
                      )),
                  dropdownColor: kMainColor,
                  // icon: Icon(
                  //   Icons.arrow_drop_down_sharp,
                  // ),
                  isExpanded: true,
                  value: valueChoice,
                  onChanged: (newvalue) {
                    setState(() {
                      valueChoice = newvalue.toString();
                    });
                  },
                  items: _selection.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Container(
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            valueItem,
                            style:
                                TextStyle(fontSize: 16, color: kGreyLightColor),
                          )),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: kLightWhiteColor),
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  title: CustomText(
                    title: "Account Privacy",
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                  ),
                  subtitle: CustomText(
                    title:
                        "Set my profile to private and require users to follow me",
                    fontSize: 11,
                    fontWeight: FontWeight.w400,
                    color: kBlackColor,
                  ),
                  trailing: Container(
                    height: 23,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: isSwitched ? kSecoundryColor : kLightWhiteColor,
                    ),
                    child: Switch(
                      value: isSwitched,
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                          print(isSwitched);
                        });
                      },
                      inactiveTrackColor: kLightWhiteColor,
                      activeTrackColor: kSecoundryColor,
                      activeColor: kMainColor,
                      inactiveThumbColor: kSecoundryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 60.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTextImageButton(
                    txt: "Next",
                    onTap: () async {
                      if (_conditons.currentState!.validate() ||
                          valueChoice != null) {
                        provider.changeIsLoading(true);
                        await AuthServices.upDateSignUp(
                          firstN: UserModel.userModel.firstN,
                          lastN: UserModel.userModel.lastN,
                          city: UserModel.userModel.city,
                          state: UserModel.userModel.state,
                          gender: valueChoice.toString(),
                          subscriptionType: "",
                          dob: selectedDate,
                          favourite: [],
                          profilePrivacy: isSwitched,
                        );
                        provider.changeIsLoading(false);
                        Helper.toRemoveUntiScreen(
                            context, SignAddProfilePitcher());
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
                    //   if (_conditons.currentState!.validate() ||
                    //       valueChoice != null) {
                    //     await AuthServices.upDateSignUp(
                    //       firstN: UserModel.userModel.firstN,
                    //       lastN: UserModel.userModel.lastN,
                    //       city: UserModel.userModel.city,
                    //       state: UserModel.userModel.state,
                    //       gender: valueChoice.toString(),
                    //       subscriptionType: "",
                    //       dob: selectedDate,
                    //       favourite: [],
                    //     ).whenComplete(() =>
                    //         Helper.toScreen(context, SignAddProfilePitcher()));
                    //     print(valueChoice);
                    //   } else {
                    //     Helper.showSnack(context, "Kindly Select Gender");
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
