class ActivityEliminationModel {
  const ActivityEliminationModel({this.title, this.subtitle, this.image});

  final title;
  final subtitle;
  final image;
}

List<ActivityEliminationModel> activeElimination = [
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (5).png",
    title: "12:41 PM, Nov 24, 2022",
    subtitle: "Craig Minkle joined the tournament",
  ),
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (6).png",
    title: "12:41 PM, Nov 24, 2022",
    subtitle:
        "Billy Raegan logged a 14” Largemouth Bass to the tournament (+14XP)",
  ),
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (6).png",
    title: "12:41 PM, Nov 24, 2022  ",
    subtitle: "Craig Davis a 22” Largemouth Bass to the tournament (+22XP)",
  ),
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (7).png",
    title: "12:41 PM, Nov 24, 2022",
    subtitle:
        "Thomas Fuel logged a 21” Largemouth Bass to the tournament (+21XP)",
  ),
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (8).png",
    title: "12:41 PM, Nov 24, 2022",
    subtitle:
        "Thomas Fuel logged a 21” Largemouth Bass to the tournament (+21XP)",
  ),
  ActivityEliminationModel(
    image: "assets/Rectangle 2597 (9).png",
    title: "12:41 PM, Nov 24, 2022",
    subtitle: "Amy Macntire joined the tournament",
  ),
];

List<ActivityEliminationModel> get activeEliminationList => activeElimination;
