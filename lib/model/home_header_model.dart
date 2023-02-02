class HomeHeaderModel {
  const HomeHeaderModel({
    this.image,
    this.title,
    this.subtitle,
  });

  final image;
  final title;
  final subtitle;
}

List<HomeHeaderModel> headerProfile = [
  HomeHeaderModel(
      image: "assets/Rectangle 2597.png",
      title: "Emily Grimes",
      subtitle: "2 wins this month"),
  HomeHeaderModel(
    image: "assets/Rectangle 2597 (1).png",
    title: "Craig Minkle",
    subtitle: "13 logs this week",
  ),
  HomeHeaderModel(
    image: "assets/Rectangle 2597 (2).png",
    title: "Billy Raegan",
    subtitle: "9 logs today",
  ),
  HomeHeaderModel(
      image: "assets/Rectangle 2597.png",
      title: "Emily Grimes",
      subtitle: "2 wins this month"),
  HomeHeaderModel(
    image: "assets/Rectangle 2597 (1).png",
    title: "Craig Minkle",
    subtitle: "13 logs this week",
  ),
  HomeHeaderModel(
    image: "assets/Rectangle 2597 (2).png",
    title: "Billy Raegan",
    subtitle: "9 logs today",
  ),
];

List<HomeHeaderModel> get headerList => headerProfile;
