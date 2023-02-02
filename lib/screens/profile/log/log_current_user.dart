import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utilites/constants.dart';
import '../../../widget/custom_text.dart';
import '../../../widget/log_current_list_tile_widget.dart';

class LogCurrentUser extends StatefulWidget {
  const LogCurrentUser({Key? key}) : super(key: key);

  @override
  State<LogCurrentUser> createState() => _LogCurrentUserState();
}

class _LogCurrentUserState extends State<LogCurrentUser> {
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
                )
              ],
            ),
          ),
        ),
        title: CustomText(
          title: "Peacock Bass",
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
            Container(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/Rectangle 2607.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomText(
              title: "Catch Details",
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: kBlackColor,
            ),
            SizedBox(
              height: 10.h,
            ),
            LogCurrentListTileWidget(
              title: "Fish Length",
              trailing: "17.3 Inches",
            ),
            LogCurrentListTileWidget(
              title: "Timestamp",
              trailing: "9:36 a.m. November 21, 2022",
            ),
            LogCurrentListTileWidget(
              title: "Location",
              trailing: "Melbourne Florida 32935",
            ),
            ListTile(
              visualDensity: VisualDensity(
                vertical: -4,
              ),
              contentPadding: EdgeInsets.zero,
              title: CustomText(
                title: "GPS",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: kSecoundryColor,
              ),
              trailing: Container(
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: kSecoundryColor,
                  )),
                ),
                child: CustomText(
                  title: "27.828402, -80.802848",
                  color: kBlackColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomText(
              title: "Community Details",
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: kBlackColor,
            ),
            LogCurrentListTileWidget(
              title: "Views",
              trailing: "9:36 a.m. November 21, 2022",
            ),
            ListTile(
              visualDensity: VisualDensity(
                vertical: -4,
              ),
              contentPadding: EdgeInsets.zero,
              title: CustomText(
                title: "Likes",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: kSecoundryColor,
              ),
              trailing: Container(
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: kSecoundryColor,
                  )),
                ),
                child: CustomText(
                  title: "83 Likes",
                  color: kBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            ListTile(
              visualDensity: VisualDensity(
                vertical: -4,
              ),
              contentPadding: EdgeInsets.zero,
              title: CustomText(
                title: "Comments",
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: kSecoundryColor,
              ),
              trailing: Container(
                padding: EdgeInsets.only(bottom: 2),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                    color: kSecoundryColor,
                  )),
                ),
                child: CustomText(
                  title: "12 comments",
                  color: kBlackColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 18.h,
            ),
            CustomText(
              title: "Environement Metrics",
              fontWeight: FontWeight.w700,
              fontSize: 13,
              color: kBlackColor,
            ),
          ],
        ),
      ),
    );
  }
}

