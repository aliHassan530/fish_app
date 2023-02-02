class LogVerifyMeasurementsModel {
  LogVerifyMeasurementsModel({
    this.image,
    this.title,
    this.subtitle,
  });

  final image;
  final title;
  final subtitle;
}

List<LogVerifyMeasurementsModel> logVerify = [
  LogVerifyMeasurementsModel(
    title: "LargemouthBass",
    subtitle: "98.2% match",
    image: "assets/ArcticChar 10 (1).png",
  ),LogVerifyMeasurementsModel(
    title: "LargemouthBass",
    subtitle: "98.2% match",
    image: "assets/ArcticChar 11 (1).png",
  ),LogVerifyMeasurementsModel(
    title: "LargemouthBass",
    subtitle: "98.2% match",
    image: "assets/ArcticChar 10 (1).png",
  ),LogVerifyMeasurementsModel(
    title: "LargemouthBass",
    subtitle: "98.2% match",
    image: "assets/ArcticChar 11 (1).png",
  ),
];

List<LogVerifyMeasurementsModel> get logVerifyList => logVerify;
