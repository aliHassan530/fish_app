class WeekModel {
  WeekModel({
    this.image,
    this.title,
    this.date,
    this.counter,
    this.sortTitle,
  });

  final image;
  final title;
  final date;
  final counter;
  final sortTitle;
}

List<WeekModel> weekModel = [
  WeekModel(
    counter: "1",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
  WeekModel(
    counter: "2",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
  WeekModel(
    counter: "3",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
  WeekModel(
    counter: "4",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
  WeekModel(
    counter: "4",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
  WeekModel(
    counter: "5",
    sortTitle: "Largemouth Bass",
    title: "19.7 Inches",
    image: "assets/Rectangle 2613.png",
    date: "8:14 AM Monday, Nov 14, 2022",
  ),
];

List<WeekModel> get weekModelList => weekModel;
