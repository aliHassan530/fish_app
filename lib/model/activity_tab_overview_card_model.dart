class ActivityTabOverViewCardModel {
  const ActivityTabOverViewCardModel({
    this.count,
    this.title,
  });

  final count;
  final title;
}

List<ActivityTabOverViewCardModel> activeTab = [
  ActivityTabOverViewCardModel(
    count: "108",
    title: "Tournaments",
  ),
  ActivityTabOverViewCardModel(
    count: "483",
    title: "Fish Logged",
  ),
  ActivityTabOverViewCardModel(
    count: "5,280",
    title: "Fish Inches",
  ),
  ActivityTabOverViewCardModel(
    count: "18.4K",
    title: "XP",
  ),
];

List<ActivityTabOverViewCardModel> get activeTabList => activeTab;
