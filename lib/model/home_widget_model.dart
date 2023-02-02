class HomeWidgetModel {
  const HomeWidgetModel({
    this.bgImage,
    this.fishName,
    this.time,
    this.profileImage,
    this.postion,
    this.titleName,
    this.subtitle,
  });

  final bgImage;
  final fishName;
  final time;
  final profileImage;
  final postion;
  final titleName;
  final subtitle;
}

List<HomeWidgetModel> homeWidget = [
  HomeWidgetModel(
    bgImage: "assets/Home Page Profile Picture.png",
    fishName: "Bass Angler Elimination",
    time: "10 Nov - 28 Nov",
    profileImage: "assets/Rectangle 2596.png",
    postion: "Current Leader",
    titleName: "Thomas Finegan",
    subtitle: "5 total fish - 93.2” Total - 17” Lead",
  ),
  HomeWidgetModel(
    bgImage: "assets/Home Page Profile Picture (4).png",
    fishName: "Bass Angler Elimination",
    time: "10 Nov - 28 Nov",
    profileImage: "assets/Rectangle 2596.png",
    postion: "Current Leader",
    titleName: "Thomas Finegan",
    subtitle: "5 total fish - 93.2” Total - 17” Lead",
  ),
  HomeWidgetModel(
    bgImage: "assets/Home Page Profile Picture (5).png",
    fishName: "Bass Angler Elimination",
    time: "10 Nov - 28 Nov",
    profileImage: "assets/Rectangle 2596.png",
    postion: "Current Leader",
    titleName: "Thomas Finegan",
    subtitle: "5 total fish - 93.2” Total - 17” Lead",
  ),
  HomeWidgetModel(
    bgImage: "assets/Home Page Profile Picture (6).png",
    fishName: "Peacock Bass Weekly Bags",
    time: "10 Nov - 28 Nov",
    profileImage: "assets/Rectangle 2596.png",
    postion: "Current Leader",
    titleName: "Thomas Finegan",
    subtitle: "5 total fish - 93.2” Total - 17” Lead",
  ),
  HomeWidgetModel(
    bgImage: "assets/Home Page Profile Picture (7).png",
    fishName: "Largemouth Bass Weekly Bags",
    time: "10 Nov - 28 Nov",
    profileImage: "assets/Rectangle 2596.png",
    postion: "Current Leader",
    titleName: "Thomas Finegan",
    subtitle: "5 total fish - 93.2” Total - 17” Lead",
  ),
];

List<HomeWidgetModel> get homeList => homeWidget;
