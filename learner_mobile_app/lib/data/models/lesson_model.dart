import 'resource_model.dart';

class LessonModel {
  final String id;
  final String title;
  final int durationSeconds;
  final String? videoUrl;
  final bool isPreviewAllowed;
  final bool isCompleted;
  final int stoppedAtSeconds;
  final List<ResourceModel> resources;

  const LessonModel({
    required this.id,
    required this.title,
    required this.durationSeconds,
    this.videoUrl,
    this.isPreviewAllowed = false,
    this.isCompleted = false,
    this.stoppedAtSeconds = 0,
    this.resources = const [],
  });

  String get formattedDuration {
    final minutes = durationSeconds ~/ 60;
    final seconds = durationSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

class ChapterModel {
  final String id;
  final String title;
  final int order;
  final List<LessonModel> lessons;

  const ChapterModel({
    required this.id,
    required this.title,
    required this.order,
    required this.lessons,
  });
}
