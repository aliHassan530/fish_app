class CommentModel {
  const CommentModel({
    this.image,
    this.title,
    this.subtitle,
    this.time,
    this.reply,
  });

  final image;
  final title;
  final subtitle;
  final time;
  final reply;
}

List<CommentModel> comment = [
  CommentModel(
    image:"assets/Rectangle 2600 (5).png",
    title: "Amy Macntire",
    subtitle: "Awesome pecock!",
    time: "12 minutes ago",
    reply: "3 replies"
  ),
  CommentModel(
      image:"assets/Rectangle 2600 (6).png",
      title: "Thomas Finegan",
      subtitle: "Wow, awesome colors. What did you catch this on? Whats your favorite lure for peacocks?",
      time: "32 minutes ago",
      reply: "1 reply"
  ),
  CommentModel(
      image:"assets/Rectangle 2600 (5).png",
      title: "Amy Macntire",
      subtitle: "Awesome pecock!",
      time: "12 minutes ago",
      reply: "3 replies"
  ),
];

List<CommentModel> get commentList => comment;
