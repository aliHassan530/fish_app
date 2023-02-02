import 'package:app/model/last_week_tab_model.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';

class LeaderBoardListTile extends StatefulWidget {
  final LastWeekTabModel? lastWeek;

  const LeaderBoardListTile({Key? key, this.lastWeek}) : super(key: key);

  @override
  State<LeaderBoardListTile> createState() => _LeaderBoardListTileState();
}

class _LeaderBoardListTileState extends State<LeaderBoardListTile> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          select = !select;
        });
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: select ? kSecoundryColor : kMainColor,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          visualDensity: const VisualDensity(vertical: -2),
          leading: Container(
            width: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomText(
                  title: widget.lastWeek!.counter,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: select ? kMainColor : kBlackColor,
                ),
                Container(
                  height: 50,
                  width: 50,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.lastWeek!.profileImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: CustomText(
            title: widget.lastWeek!.title,
            fontSize: 16,
            maxLines: 1,
            fontWeight: FontWeight.w600,
            color: select ? kMainColor : kBlackColor,
          ),
          subtitle: CustomText(
            title: widget.lastWeek!.subtitle,
            fontSize: 11,
            maxLines: 1,
            fontWeight: FontWeight.w500,
            color: select ? kMainColor : kBlackColor,
          ),
          trailing: CustomText(
            title: widget.lastWeek!.trailing,
            fontSize: 11,
            maxLines: 1,
            fontWeight: FontWeight.w600,
            color: select ? kMainColor : kBlackColor,
          ),
        ),
      ),
    );
  }
}
