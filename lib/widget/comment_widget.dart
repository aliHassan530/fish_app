import 'package:app/model/comment_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../widget/custom_text.dart';

class CommentWidget extends StatelessWidget {
  final CommentModel? comment;

  const CommentWidget({Key? key, this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 36.h,
            width: 36.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(comment!.image),
            ),
          ),
        ],
      ),
      title: Row(
        children: [
          CustomText(
            title: comment!.title,
            color: kBlackColor,
            fontSize: 14,
            maxLines: 1,
            fontWeight: FontWeight.w700,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: CustomText(
              title: comment!.time,
              color: kBlackColor,
              fontSize: 12,
              maxLines: 1,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            title: comment!.subtitle,
            color: kBlackColor,
            fontSize: 12,
            maxLines: 1,
            fontWeight: FontWeight.w400,
          ),
          SizedBox(
            height: 8.h,
          ),
          CustomText(
            title: comment!.reply,
            color: kGreyDarkColor,
            fontSize: 12,
            maxLines: 1,
            fontWeight: FontWeight.w400,
          ),
        ],
      ),
    );
  }
}
