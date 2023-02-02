import 'package:app/model/user_model.dart';
import 'package:app/screens/profile/profile_private.dart';
import 'package:app/screens/profile/profile_public.dart';
import 'package:app/utilites/helper.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utilites/constants.dart';

class HomeHeaderProfile extends StatelessWidget {
  HomeHeaderProfile({
    this.firstN,
    this.lastN,
    this.image,
    this.subtitle,
    this.notId,
    this.profilePrivacy,
  });

  String? firstN;
  String? lastN;
  final image;
  String? notId;
  String? subtitle;
  var profilePrivacy;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        profilePrivacy == true
            ? Helper.toScreen(context, ProfilePrivateScreen(
          nodeId: notId,
        ))
            : Helper.toScreen(context, ProfilePublicScreen(
          nodeId: notId,
        ));
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 80,
              width: 80,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  image,
                  // "assets/Rectangle 2597.png",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: "${firstN} ${lastN}",
              // "Emily Grimes",
              fontSize: 12,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
            SizedBox(
              height: 5.h,
            ),
            CustomText(
              title: "2  wins this month",
              // "2 wins this month",
              textAlign: TextAlign.center,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: kGreyDarkColor,
            ),
          ],
        ),
      ),
    );
  }
}
