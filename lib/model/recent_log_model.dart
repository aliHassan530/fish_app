class RecentLogModel {
  const RecentLogModel({
    this.image,
    this.title,
    this.data,
    this.inchesNumber,
  });

  final image;
  final inchesNumber;
  final title;
  final data;
}

List<RecentLogModel> recentLog = [
  RecentLogModel(
    image: "assets/fish1.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),
  RecentLogModel(
    image: "assets/fish2.PNG",
    title: "Peacock Bass",
    inchesNumber: "15.5””",
    data: "Nov 12, 2022",
  ),
  RecentLogModel(
    image: "assets/fish6.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),
  RecentLogModel(
    image: "assets/fish4.PNG",
    title: "Peacock Bass",
    inchesNumber: "15.5””",
    data: "Nov 12, 2022",
  ),
  RecentLogModel(
    image: "assets/fish5.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),

  RecentLogModel(
    image: "assets/fish6.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),

  RecentLogModel(
    image: "assets/fish7.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),

  RecentLogModel(
    image: "assets/fish8.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),

  RecentLogModel(
    image: "assets/fish9.PNG",
    title: "Largemouth Bass",
    inchesNumber: "17.2”",
    data: "Nov 12, 2022",
  ),
];

List<RecentLogModel> get recentLogList => recentLog;

// upcoming Jobs
