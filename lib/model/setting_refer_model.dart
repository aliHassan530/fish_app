class SettingReferModel {
  const SettingReferModel({
    this.img,
    this.title,
    this.subTitle,
    this.remaining,
  });

  final img;
  final subTitle;
  final title;
  final remaining;
}

List<SettingReferModel> settingRefer = [
  SettingReferModel(
    img: "assets/image 23.png",
    title: "Free Shirt!",
    subTitle: "When 5 friends sign up for a membership",
    remaining: "2 referrels accepted - 8 remaining",
  ),
  SettingReferModel(
    img: "assets/image 22.png",
    title: "Free Hat!",
    subTitle: "When 10 friends sign up for a membership",
    remaining: "2 referrels accepted - 8 remaining",
  ),

  SettingReferModel(
    img: "assets/LogoCircled@3x 1.png",
    title: "Free Hoodie!",
    subTitle: "When 15 friends sign up for a membership",
    remaining: "2 referrels accepted - 13 remaining",
  ),

];

List<SettingReferModel> get settingReferList => settingRefer;
