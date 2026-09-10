import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../components/recommendation_card.dart';

class RecommendationScreen extends StatefulWidget {
  const RecommendationScreen({super.key});

  @override
  State<RecommendationScreen> createState() => _RecommendationScreenState();
}

class _RecommendationScreenState extends State<RecommendationScreen> {
  bool isColdStartUser = false; // Toggle for testing cold start vs AI CF recommendation
  final List<String> selectedTopics = [];

  @override
  Widget build(BuildContext context) {
    final recommendations = MockData.recommendedCourses;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gợi ý dành cho bạn'),
        actions: [
          IconButton(
            icon: Icon(isColdStartUser ? Icons.psychology : Icons.person_add_alt_1),
            tooltip: 'Chuyển chế độ Cold Start / AI Recommendation',
            onPressed: () {
              setState(() {
                isColdStartUser = !isColdStartUser;
              });
            },
          ),
        ],
      ),
      body: isColdStartUser ? _buildColdStartUI() : _buildRecommendationUI(recommendations),
    );
  }

  // AI Collaborative Filtering Recommendations View
  Widget _buildRecommendationUI(List recommendations) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.primaryLight,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: AppColors.primary.withAlpha(50)),
            ),
            child: const Row(
              children: [
                Text('🤖', style: TextStyle(fontSize: 24)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Được đề xuất dựa trên các khóa học bạn đã học và lịch sử quan tâm của cộng đồng học viên.',
                    style: TextStyle(fontSize: 12, color: AppColors.primaryDark, height: 1.3),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text('Gợi ý phù hợp nhất', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ...recommendations.map((course) {
            return RecommendationCard(
              course: course,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Xem gợi ý: ${course.title}')),
                );
              },
            );
          }),
        ],
      ),
    );
  }

  // Cold Start UI for New Users without Interaction History
  Widget _buildColdStartUI() {
    final categories = MockData.categories;
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Chào mừng bạn! 👋', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textHeading)),
          const SizedBox(height: 6),
          const Text('Chọn các chủ đề bạn quan tâm để hệ thống gợi ý khóa học phù hợp nhất:', style: TextStyle(fontSize: 14, color: AppColors.textSecondary)),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.8,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final cat = categories[index];
                final isSelected = selectedTopics.contains(cat.id);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      if (isSelected) {
                        selectedTopics.remove(cat.id);
                      } else {
                        selectedTopics.add(cat.id);
                      }
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? AppColors.primaryLight : AppColors.surface,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: isSelected ? AppColors.primary : AppColors.border,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(cat.icon, style: const TextStyle(fontSize: 22)),
                        const SizedBox(height: 4),
                        Text(
                          cat.name,
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? AppColors.primary : AppColors.textHeading,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: selectedTopics.isEmpty
                  ? null
                  : () {
                      setState(() {
                        isColdStartUser = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Đã cập nhật sở thích! Hiển thị gợi ý phù hợp.')),
                      );
                    },
              child: const Text('Hoàn tất chọn chủ đề'),
            ),
          ),
        ],
      ),
    );
  }
}
