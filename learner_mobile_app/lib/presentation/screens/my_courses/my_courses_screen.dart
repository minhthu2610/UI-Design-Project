import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../../data/models/course_model.dart';
import '../../components/empty_state.dart';
import '../../components/progress_bar.dart';

class MyCoursesScreen extends StatefulWidget {
  const MyCoursesScreen({super.key});

  @override
  State<MyCoursesScreen> createState() => _MyCoursesScreenState();
}

class _MyCoursesScreenState extends State<MyCoursesScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final enrolledCourses = MockData.enrolledCourses;
    final ongoingCourses = enrolledCourses.where((c) => !c.isCompleted).toList();
    final completedCourses = enrolledCourses.where((c) => c.isCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khóa học của tôi'),
        bottom: TabBar(
          controller: _tabController,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          indicatorWeight: 3,
          tabs: [
            Tab(text: 'Đang học (${ongoingCourses.length})'),
            Tab(text: 'Đã hoàn thành (${completedCourses.length})'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab 1: Ongoing Courses
          _buildCourseList(
            courses: ongoingCourses,
            emptyTitle: 'Bạn chưa có khóa học nào đang học',
            emptyDesc: 'Hãy khám phá thư viện khóa học phong phú và đăng ký ngay!',
            isCompletedTab: false,
          ),

          // Tab 2: Completed Courses
          _buildCourseList(
            courses: completedCourses,
            emptyTitle: 'Chưa có khóa học hoàn thành',
            emptyDesc: 'Hoàn thành 100% các bài học để nhận chứng chỉ chính thức.',
            isCompletedTab: true,
          ),
        ],
      ),
    );
  }

  Widget _buildCourseList({
    required List<CourseModel> courses,
    required String emptyTitle,
    required String emptyDesc,
    required bool isCompletedTab,
  }) {
    if (courses.isEmpty) {
      return EmptyState(
        icon: isCompletedTab ? '🎓' : '📖',
        title: emptyTitle,
        description: emptyDesc,
        buttonText: 'Khám phá ngay',
        onButtonTap: () {},
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 14),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.surface,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 90,
                      height: 65,
                      child: Image.network(
                        course.coverImage,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(color: AppColors.divider),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColors.textHeading),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course.instructorName,
                          style: const TextStyle(fontSize: 12, color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    isCompletedTab ? '✓ Đã hoàn thành 100%' : 'Tiến độ: ${course.progress.toInt()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: isCompletedTab ? AppColors.success : AppColors.primary,
                    ),
                  ),
                  Text(
                    '${course.lessonsCount} bài học',
                    style: const TextStyle(fontSize: 12, color: AppColors.textMuted),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              CustomProgressBar(
                progress: isCompletedTab ? 100 : course.progress,
                color: isCompletedTab ? AppColors.success : AppColors.primary,
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: isCompletedTab
                    ? OutlinedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Xem chứng chỉ PDF khóa học: ${course.title}')),
                          );
                        },
                        icon: const Icon(Icons.workspace_premium_rounded, color: AppColors.success, size: 18),
                        label: const Text('Xem & Tải Chứng Chỉ PDF', style: TextStyle(color: AppColors.success)),
                      )
                    : ElevatedButton.icon(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Vào bài học: ${course.title}')),
                          );
                        },
                        icon: const Icon(Icons.play_circle_fill_rounded, size: 18),
                        label: const Text('Tiếp tục học'),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
