import 'package:app/model/user_model.dart';
import 'package:app/screens/auth/login_screen.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../services/auth_services.dart';

class SettingLogOut extends StatefulWidget {
  @override
  _SettingLogOutState createState() => _SettingLogOutState();
}

class _SettingLogOutState extends State<SettingLogOut> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Material(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: kMainColor,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kMainColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    title: "Logout",
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    title: "Log out of Fish Masters Live?",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 23.33.h,
                  ),
                  Container(
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border(
                        top:
                            BorderSide(color: kGreyLightColor.withOpacity(0.3)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomText(
                          title: "Nevermind",
                          fontSize: 17,
                          color: kSecoundryColor,
                          fontWeight: FontWeight.w400,
                        ),
                        Container(
                          height: 45.h,
                          child: VerticalDivider(
                            color: kGreyLightColor,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async{
                            await AuthServices.logout();
                            Helper.toReplacementScreen(context, LoginScreen());
                            Helper.showSnack(
                                context, "${UserModel.userModel.firstN} ${UserModel.userModel.lastN} LogOut Successfully");
                          },
                          child: CustomText(
                            title: "Logout",
                            fontSize: 17,
                            color: kTextRedColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
