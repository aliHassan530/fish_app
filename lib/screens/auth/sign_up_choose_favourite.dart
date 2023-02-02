import 'package:app/model/sign_up_choose_favourite_model.dart';
import 'package:app/screens/auth/sing_up_completing_setup.dart';
import 'package:app/services/auth_services.dart';
import 'package:app/utilites/constants.dart';
import 'package:app/widget/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../model/user_model.dart';
import '../../provider/main_provider.dart';
import '../../utilites/helper.dart';
import '../../widget/custom_button.dart';

class SignUpChooseFavourite extends StatefulWidget {
  const SignUpChooseFavourite({Key? key}) : super(key: key);

  @override
  State<SignUpChooseFavourite> createState() => _SignUpChooseFavouriteState();
}

class _SignUpChooseFavouriteState extends State<SignUpChooseFavourite> {
  List<String> selectedIndex = [];

  // List<String> indexValue = [];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MainProvider>(context, listen: false);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            SizedBox(
              height: 40.h,
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: const EdgeInsets.all(5),
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
              height: 11.h,
            ),
            Center(
              child: Image.asset(
                "assets/Favorites.png",
                height: 36,
                width: 146.w,
              ),
            ),
            SizedBox(height: 13.h),
            CustomText(
              title: "Select up to 5 species you fish for most",
              color: kGreyDarkColor,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(
              height: 44.h,
            ),
            GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                // mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                // childAspectRatio: 0.99,
              ),
              itemCount: chooseFavouriteList.length,
              itemBuilder: (context, index) {
                // selectedIndex == chooseFavourite[index].title;
                return ContactItem(
                  chooseFavourite[index].image,
                  chooseFavourite[index].title,
                  chooseFavourite[index].isSelected,
                  index,
                );
              },
            ),
            SizedBox(
              height: 60.h,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: kMainColor,
        child: GestureDetector(
          onTap: () {
            // Helper.toScreen(context, SignUp());
          },
          child: Container(
              height: 80,
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    title: selectedIndex.isNotEmpty
                        ? "Selected(${selectedIndex.length})"
                        : "Save",
                    onPressed: () async {
                      if (selectedIndex.isNotEmpty) {
                        provider.changeIsLoading(true);
                        await AuthServices.upDateSignUp(
                          firstN: UserModel.userModel.firstN,
                          lastN: UserModel.userModel.lastN,
                          city: UserModel.userModel.city,
                          state: UserModel.userModel.state,
                          gender: UserModel.userModel.gender,
                          subscriptionType: "",
                          dob: UserModel.userModel.dob,
                          favourite: selectedIndex,
                        );
                        print("-------------");
                        print(selectedIndex);
                        print("-------------");
                        provider.changeIsLoading(false);
                        Helper.toRemoveUntiScreen(
                            context, SignupCompletingSetup());
                        Helper.showSnack(
                            context, "Profile Updated Successfully!!!");
                      } else {
                        Helper.showSnack(
                          context,
                          "Please fill all the fields to continue",
                        );
                      }
                    },
                    btnColor: kSecoundryColor,
                    textColor: kMainColor,
                    btnHeight: 46.h,
                    btnRadius: 25,
                  ),
                ],
              )),
        ),
      ),
    );
  }

  Widget ContactItem(String image, String title, bool isSelected, int index) {
    return GestureDetector(
      onTap: () async {
        setState(
          () {
            // chooseFavourite[index].isSelected =
            //     !chooseFavourite[index].isSelected;
            // if (chooseFavourite[index].isSelected == true) {
            //   selectedIndex.add(title);
            // } else if (chooseFavourite[index].isSelected == false) {
            //   selectedIndex.removeWhere(
            //       (element) => element.title == chooseFavourite[index].title);
            // }
            // bool check = selectedIndex.where((element) => element == chooseFavourite[index].title);
            if (selectedIndex.contains(chooseFavourite[index].title)) {
              selectedIndex.removeWhere(
                  (element) => element == chooseFavourite[index].title);
              chooseFavourite[index].isSelected = false;
            } else if (selectedIndex.length <= 4) {
              selectedIndex.add(title);
              chooseFavourite[index].isSelected = true;
            }
            print(selectedIndex);

            // indexValue==selectedIndex[index].title;
            //  print("my index value${indexValue}");
          },
        );
      },
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: kSecoundryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  color: kMainColor,
                  child: Center(
                      child: Image.asset(
                    image,
                    height: 36,
                  )),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomText(
                  title: title,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kMainColor,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          isSelected
              ? Container(
                  color: kBlackColor.withOpacity(0.3),
                  width: 120.w,
                  height: 100.h,
                  child: Center(
                      child: Image.asset(
                    "assets/CheckMark 1.png",
                    height: 40.h,
                  )),
                )
              : Container(),
        ],
      ),
    );
    // ListTile(
    //   leading: isSelected
    //       ? Image.asset(
    //           "assets/Group 219.png",
    //           height: 35.h,
    //         )
    //       : Container(
    //           height: 35,
    //           width: 35,
    //           decoration: BoxDecoration(
    //               color: kSecoundryColor,
    //               borderRadius: BorderRadius.circular(100)),
    //           child: Center(
    //               child: Image.asset(
    //             "assets/Group (1).png",
    //             height: 15,
    //           )),
    //         ),
    //   title: CustomText(
    //     title: "My Custom Palette 3",
    //     fontSize: 16,
    //     fontWeight: FontWeight.w400,
    //     color: kWhiteColor,
    //   ),
    //   subtitle: CustomText(
    //     title: "My Custom Palette 3",
    //     fontSize: 12,
    //     fontWeight: FontWeight.w400,
    //     color: kWhiteColor,
    //   ),
    //   onTap: () {
    //     setState(
    //       () {
    //         contacts[index].isSelected = !contacts[index].isSelected;
    //         if (contacts[index].isSelected == true) {
    //           selectedContacts.add(ContactModel(name, phoneNumber, true));
    //         } else if (contacts[index].isSelected == false) {
    //           selectedContacts.removeWhere(
    //               (element) => element.name == contacts[index].name);
    //         }
    //       },
    //     );
    //   },
    // );
  }
}

class FavouriteFishWidget extends StatefulWidget {
  final SignUpChooseFavouriteModel? favouriteModel;

  FavouriteFishWidget({Key? key, this.favouriteModel}) : super(key: key);

  @override
  State<FavouriteFishWidget> createState() => _FavouriteFishWidgetState();
}

class _FavouriteFishWidgetState extends State<FavouriteFishWidget> {
  bool select = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        select = !select;
        setState(() {});
      },
      child: Stack(
        children: [
          Container(
            width: 120.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: kSecoundryColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  margin: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  color: kMainColor,
                  child: Center(
                      child: Image.asset(
                    widget.favouriteModel!.image,
                    height: 36,
                  )),
                ),
                SizedBox(
                  height: 7.h,
                ),
                CustomText(
                  title: widget.favouriteModel!.title,
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: kMainColor,
                  maxLines: 1,
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
          select
              ? Container(
                  color: kBlackColor.withOpacity(0.3),
                  width: 120.w,
                  height: 100.h,
                  child: Center(
                      child: Image.asset(
                    "assets/CheckMark 1.png",
                    height: 40.h,
                  )),
                )
              : Container(),
        ],
      ),
    );
  }
}
