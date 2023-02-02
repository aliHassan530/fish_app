class ActivityTabAchievementModel {
  const ActivityTabAchievementModel({
    this.image,
  });

  final image;
}

List<ActivityTabAchievementModel> achieveTab = [
  ActivityTabAchievementModel(image: "assets/image 7 (4).png"),
  ActivityTabAchievementModel(image: "assets/image 11.png"),
  ActivityTabAchievementModel(image: "assets/image 12 (1).png"),
];

List<ActivityTabAchievementModel> get achieveTabList => achieveTab;
