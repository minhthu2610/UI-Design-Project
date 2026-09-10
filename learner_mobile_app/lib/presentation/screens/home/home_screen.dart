import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../../data/models/category_model.dart';
import '../../../data/models/course_model.dart';
import '../../components/category_chip.dart';
import '../../components/continue_learning_card.dart';
import '../../components/course_card.dart';
import '../../components/recommendation_card.dart';
import '../../components/section_header.dart';

class HomeScreen extends StatefulWidget {
  final Function(int) onTabChange;

  const HomeScreen({super.key, required this.onTabChange});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCategoryId = 'all';

  @override
  Widget build(BuildContext context) {
    final user = MockData.currentUser;
    final enrolledCourses = MockData.enrolledCourses;
    final continueCourse = enrolledCourses.isNotEmpty ? enrolledCourses.first : null;
    final recommendedCourses = MockData.recommendedCourses;
    final publishedCourses = MockData.publishedCourses;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header User Greeting
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 22,
                          backgroundImage: NetworkImage(user.avatar ?? ''),
                          backgroundColor: AppColors.primaryLight,
                          child: user.avatar == null
                              ? Text(user.fullName[0], style: const TextStyle(fontWeight: FontWeight.bold))
                              : null,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Xin chào, ${user.fullName} 👋',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textHeading,
                              ),
                            ),
                            const Text(
                              'Hôm nay bạn muốn học gì?',
                              style: TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.notifications_none_rounded, size: 26),
                    ),
                  ],
                ),
              ),

              // Search Bar Banner
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () => widget.onTabChange(1), // Switch to Explore tab
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.border),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search_rounded, color: AppColors.textMuted),
                        SizedBox(width: 10),
                        Text(
                          'Bạn muốn học gì hôm nay?',
                          style: TextStyle(color: AppColors.textMuted, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // SECTION 1: Continue Learning Card
              if (continueCourse != null) ...[
                SectionHeader(
                  title: 'Tiếp tục học',
                  actionText: 'Xem tất cả',
                  onActionTap: () => widget.onTabChange(2), // Switch to My Courses
                ),
                ContinueLearningCard(
                  course: continueCourse,
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Vào bài học: ${continueCourse.title}')),
                    );
                  },
                ),
                const SizedBox(height: 12),
              ],

              // SECTION 2: AI Recommendations
              if (recommendedCourses.isNotEmpty) ...[
                SectionHeader(
                  title: 'Gợi ý dành riêng cho bạn',
                  actionText: 'Xem thêm',
                  onActionTap: () => widget.onTabChange(3), // Switch to Recommendation tab
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: recommendedCourses.map((course) {
                      return RecommendationCard(
                        course: course,
                        onTap: () => _openCourseDetail(course),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 12),
              ],

              // SECTION 3: Categories Chips
              const SectionHeader(title: 'Danh mục khóa học'),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: CategoryChip(
                        category: const CategoryModel(
                          id: 'all',
                          name: 'Tất cả',
                          count: 0,
                          code: 'ALL',
                          icon: '🔥',
                        ),
                        isSelected: selectedCategoryId == 'all',
                        onTap: () => setState(() => selectedCategoryId = 'all'),
                      ),
                    ),
                    ...MockData.categories.map((cat) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: CategoryChip(
                          category: cat,
                          isSelected: selectedCategoryId == cat.id,
                          onTap: () => setState(() => selectedCategoryId = cat.id),
                        ),
                      );
                    }),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // SECTION 4: Published Featured Courses
              SectionHeader(
                title: 'Khóa học nổi bật',
                actionText: 'Khám phá',
                onActionTap: () => widget.onTabChange(1),
              ),
              SizedBox(
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  itemCount: publishedCourses.length,
                  itemBuilder: (context, index) {
                    final course = publishedCourses[index];
                    return CourseCard(
                      course: course,
                      isHorizontal: true,
                      onTap: () => _openCourseDetail(course),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _openCourseDetail(CourseModel course) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Mở chi tiết khóa học: ${course.title}')),
    );
  }
}
