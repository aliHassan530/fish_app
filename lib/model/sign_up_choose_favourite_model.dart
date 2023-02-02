class SignUpChooseFavouriteModel {
  SignUpChooseFavouriteModel({
    this.image,
    this.title,
    required this.isSelected,
  });

  final image;
  final title;
  bool isSelected;
}

List<SignUpChooseFavouriteModel> chooseFavourite = [
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 1.png",
    title: "Arctic Char",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 2.png",
    title: "Bluegill",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 2.png",
    title: "Bonefish",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 2.png",
    title: "Brook Trout",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 5.png",
    title: "Brook Trouts",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 6.png",
    title: "Peacock Bass",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 7.png",
    title: "Salmon",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 8.png",
    title: "Common Carp",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 10.png",
    title: "Crappie",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 10.png",
    title: "Flounder",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 11.png",
    title: "Greyling",
    isSelected: false,
  ),
  SignUpChooseFavouriteModel(
    image: "assets/ArcticChar 12.png",
    title: "Lake Trout",
    isSelected: false,
  ),
];

List<SignUpChooseFavouriteModel> get chooseFavouriteList => chooseFavourite;

// upcoming Jobs
