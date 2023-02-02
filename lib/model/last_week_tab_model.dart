class LastWeekTabModel {
  const LastWeekTabModel({
    this.counter,
    this.profileImage,
    this.title,
    this.subtitle,
    this.trailing});

  final counter;
  final profileImage;
  final title;
  final subtitle;
  final trailing;
}

List<LastWeekTabModel> lastWeekTab = [
  LastWeekTabModel(
    counter: "1",
    profileImage: "assets/Rectangle 2597 (5).png",
    title: "Emily Grimes",
    subtitle: "Master Level 3 - NC, United States",
    trailing: "314 INCHES",
  ),
  LastWeekTabModel(
    counter: "2",
    profileImage: "assets/Rectangle 2597 (6).png",
    title: "Craig Minkle",
    subtitle: "Elite Level 1 - Texas US",
    trailing: "314 INCHES",
  ),
  LastWeekTabModel(
    counter: "3",
    profileImage: "assets/Rectangle 2597 (7).png",
    title: "Billy Raegan",
    subtitle: "Pro Level 3 - Texas US",
    trailing: "308 INCHES",
  ),
  LastWeekTabModel(
    counter: "4",
    profileImage: "assets/Rectangle 2597 (8).png",
    title: "Craig Davis",
    subtitle: "Elite Master - FL, United States",
    trailing: "291 INCHES",
  ),

  LastWeekTabModel(
    counter: "5",
    profileImage: "assets/Rectangle 2597 (9).png",
    title: "Thomas Fuel",
    subtitle: "Junior Level 3 - Texas US",
    trailing: "231 INCHES",
  ),

  LastWeekTabModel(
    counter: "6",
    profileImage: "assets/Rectangle 2597 (10).png",
    title: "Achilles Ligyron",
    subtitle: "Rookie Level 2 - Texas US",
    trailing: "208 INCHES",
  ),

  LastWeekTabModel(
    counter: "7",
    profileImage: "assets/Rectangle 2598.png",
    title: "Amy Macntire",
    subtitle: "Rookie Level 1 - Texas US",
    trailing: "197 INCHES",
  ),

  LastWeekTabModel(
    counter: "8",
    profileImage: "assets/Rectangle 2599.png",
    title: "Jeff Lindsay",
    subtitle: "Amatuer Level 3 - Texas US",
    trailing: "188 INCHES",
  ),

  LastWeekTabModel(
    counter: "9",
    profileImage: "assets/Rectangle 2600.png",
    title: "Kendall Riley",
    subtitle: "Elite Level 2 - Texas US",
    trailing: "104 INCHES",
  ),
];

List<LastWeekTabModel> get lastWeekTabList => lastWeekTab;
