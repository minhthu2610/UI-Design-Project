import 'lesson_model.dart';
import 'review_model.dart';

class CourseModel {
  final String id;
  final String title;
  final String categoryId;
  final String categoryName;
  final String instructorName;
  final double rating;
  final int reviewCount;
  final double price;
  final double? originalPrice;
  final String coverImage;
  final String level;
  final String duration;
  final int lessonsCount;
  final String status; // 'Đã xuất bản', 'Bản nháp'
  final String? shortDescription;
  final String? fullDescription;
  final String? learningOutcomes;
  final bool isEnrolled;
  final bool isCompleted;
  final double progress; // 0.0 to 100.0
  final String? lastAccessedLesson;
  final double? recommendationScore; // Collaborative Filtering Score
  final String? recommendationReason;
  final List<ChapterModel> chapters;
  final List<ReviewModel> reviews;

  const CourseModel({
    required this.id,
    required this.title,
    required this.categoryId,
    required this.categoryName,
    required this.instructorName,
    required this.rating,
    required this.reviewCount,
    required this.price,
    this.originalPrice,
    required this.coverImage,
    required this.level,
    required this.duration,
    required this.lessonsCount,
    required this.status,
    this.shortDescription,
    this.fullDescription,
    this.learningOutcomes,
    this.isEnrolled = false,
    this.isCompleted = false,
    this.progress = 0.0,
    this.lastAccessedLesson,
    this.recommendationScore,
    this.recommendationReason,
    this.chapters = const [],
    this.reviews = const [],
  });

  bool get isFree => price == 0;
  bool get hasDiscount => originalPrice != null && originalPrice! > price;
}
