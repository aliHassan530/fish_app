class ProfileTournmnetEliminationModel {
  const ProfileTournmnetEliminationModel({
    this.img,
    this.title,
    this.date,
    this.time,
  });

  final img;
  final date;
  final title;
  final time;
}

List<ProfileTournmnetEliminationModel> profileElimination = [
  ProfileTournmnetEliminationModel(
    img: "assets/Capture.PNG",
    title: "Bass Master Series",
    date: "10 Nov - 28 Nov",
    time: "1 hour until next cut line ...",
  ),
  ProfileTournmnetEliminationModel(
    img: "assets/wood.PNG",
    title: "Bass Master Series",
    date: "10 Nov - 28 Nov",
    time: "1 hour until next cut line ...",
  ),

  ProfileTournmnetEliminationModel(
    img: "assets/wood.PNG",
    title: "Bass Master Series",
    date: "10 Nov - 28 Nov",
    time: "1 hour until next cut line ...",
  ),

  ProfileTournmnetEliminationModel(
    img: "assets/wood.PNG",
    title: "Bass Master Series",
    date: "10 Nov - 28 Nov",
    time: "1 hour until next cut line ...",
  ),
];

List<ProfileTournmnetEliminationModel> get profileEliminationList => profileElimination;
