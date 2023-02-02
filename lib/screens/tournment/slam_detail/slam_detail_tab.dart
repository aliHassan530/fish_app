import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_button.dart';

class SlamDetailTabScreen extends StatefulWidget {
  const SlamDetailTabScreen({Key? key}) : super(key: key);

  @override
  State<SlamDetailTabScreen> createState() => _SlamDetailTabScreenState();
}

class _SlamDetailTabScreenState extends State<SlamDetailTabScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            ListTile(
              visualDensity: VisualDensity(vertical: -4),
              minLeadingWidth: -4,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image 13 (4).png",
                    height: 20.h,
                  ),
                ],
              ),
              title: CustomText(
                title: "24 Anglers Joined",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: kBlackColor,
              ),
            ),
            ListTile(
              minLeadingWidth: -4,
              visualDensity: VisualDensity(vertical: -4),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image 14.png",
                    height: 20.h,
                  ),
                ],
              ),
              title: CustomText(
                title: "Nov 3, 2022 - Nov28 2022  ",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: kBlackColor,
              ),
            ),
            ListTile(
              minLeadingWidth: -4,
              visualDensity: VisualDensity(vertical: -4),
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/image 15 (2).png",
                    height: 20.h,
                  ),
                ],
              ),
              title: CustomText(
                title: "Elimination Event - Beat each cut line",
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: kBlackColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomText(
                    title: "Eligible Species",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: kBlackColor,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EligileSpeciesWidget(
                        image: "assets/ArcticChar 10 (2).png",
                        title: "Red Drum",
                      ),
                      EligileSpeciesWidget(
                        image: "assets/ArcticChar 11 (1).png",
                        title: "Spotted Seatrout",
                      ),
                      EligileSpeciesWidget(
                        image: "assets/ArcticChar 11 (3).png",
                        title: "Flounder",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomText(
                    title: "Event Description & Rules",
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: kBlackColor,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  CustomText(
                    title:
                        "This series is broken into 3 segments. The first segment will last 2 weeks and allow 10 fish to be submitted. Anglers with the top 75% longest length of total bag will make the cut. The next segment will be week 3 of the month and allow for 5 fish submitted. The cutline will repeat for the top 50% remaining and the final segment will be week 4 of the month. Same as week 3, each angler is allowed to submit 5 fish. Each segment your total length will restart at 0. The winner of this tournament will be the angler who makes it to the final week and has the longest length in week 4 alone.",
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                    color: kBlackColor,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        height: 75.h,
        color: Colors.transparent,
        child: Column(
          children: [
            CustomButton(
              btnHeight: 54.h,
              btnRadius: 100,
              onPressed: () {},
              title: "Join Tournament",
              textColor: kMainColor,
              btnColor: kSecoundryColor,
            ),
          ],
        ),
      ),
    );
  }
}

class EligileSpeciesWidget extends StatelessWidget {
  const EligileSpeciesWidget({
    this.title,
    this.image,
  });

  final title;
  final image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      child: Column(
        children: [
          Image.asset(
            image,
            // "assets/ArcticChar 10 (1).png",
            height: 36.h,
          ),
          SizedBox(
            height: 10.h,
          ),
          CustomText(
            title: title,
            fontWeight: FontWeight.w400,
            fontSize: 12,
            maxLines: 1,
            color: kBlackColor,
          ),
        ],
      ),
    );
  }
}
