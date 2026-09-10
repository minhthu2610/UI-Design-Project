class ReviewModel {
  final String id;
  final String studentName;
  final String? studentAvatar;
  final int rating;
  final String comment;
  final String date;

  const ReviewModel({
    required this.id,
    required this.studentName,
    this.studentAvatar,
    required this.rating,
    required this.comment,
    required this.date,
  });
}
