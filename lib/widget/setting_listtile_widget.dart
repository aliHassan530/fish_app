import 'package:flutter/material.dart';

import '../../utilites/constants.dart';
import '../../widget/custom_text.dart';

class SettingListTileWidget extends StatelessWidget {
  SettingListTileWidget({
    this.onTap,
    this.icon,
    this.title,
  });

  Function? onTap;
  final icon;
  final title;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        onTap!();
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 7),
          leading: icon,
          // Icon(Icons.account_box,color: kGreyLightColor,),
          title: CustomText(
            title: title,
            fontSize: 15,
            color: kBlackColor,
          ),
          trailing: Image.asset(
            "assets/Stroke 1 (1).png",
            height: 15,
          ),
        ),
      ),
    );
  }
}
