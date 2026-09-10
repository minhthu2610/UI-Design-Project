import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../data/mock_data.dart';
import '../../components/course_card.dart';
import '../../components/empty_state.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String searchQuery = '';
  String selectedCategoryId = 'all';

  @override
  Widget build(BuildContext context) {
    // Strictly filter PUBLISHED courses only (Draft courses like KH05 are excluded)
    final filteredCourses = MockData.publishedCourses.where((course) {
      final matchSearch = searchQuery.isEmpty ||
          course.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          (course.shortDescription?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false);
      final matchCat = selectedCategoryId == 'all' || course.categoryId == selectedCategoryId;
      return matchSearch && matchCat;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Khám phá khóa học'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            onPressed: _showFilterModal,
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Input
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (val) => setState(() => searchQuery = val),
              decoration: InputDecoration(
                hintText: 'Tìm theo tên, mô tả khóa học...',
                prefixIcon: const Icon(Icons.search_rounded, color: AppColors.textMuted),
                suffixIcon: searchQuery.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 18),
                        onPressed: () => setState(() => searchQuery = ''),
                      )
                    : null,
              ),
            ),
          ),

          // Horizontal Category Filter Pills
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            child: Row(
              children: [
                _buildCategoryPill('all', 'Tất cả'),
                ...MockData.categories.map((c) => _buildCategoryPill(c.id, c.name)),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Filter Count Bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Hiển thị ${filteredCourses.length} khóa học',
                  style: const TextStyle(fontSize: 13, color: AppColors.textSecondary, fontWeight: FontWeight.w500),
                ),
                const Row(
                  children: [
                    Icon(Icons.sort_rounded, size: 16, color: AppColors.textSecondary),
                    SizedBox(width: 4),
                    Text(
                      'Phổ biến nhất',
                      style: TextStyle(fontSize: 12, color: AppColors.primary, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 16, color: AppColors.divider),

          // Course List
          Expanded(
            child: filteredCourses.isEmpty
                ? const EmptyState(
                    icon: '🔍',
                    title: 'Không tìm thấy khóa học',
                    description: 'Thử tìm kiếm với từ khóa khác hoặc bỏ các bộ lọc.',
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: filteredCourses.length,
                    itemBuilder: (context, index) {
                      final course = filteredCourses[index];
                      return CourseCard(
                        course: course,
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Mở chi tiết: ${course.title}')),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPill(String id, String label) {
    final isSelected = selectedCategoryId == id;
    return GestureDetector(
      onTap: () => setState(() => selectedCategoryId = id),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryLight : AppColors.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? AppColors.primary : AppColors.textBody,
          ),
        ),
      ),
    );
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Bộ lọc nâng cao', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.close)),
                ],
              ),
              const SizedBox(height: 12),
              const Text('Mức giá', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Miễn phí')),
                  Chip(label: Text('Dưới 500k')),
                  Chip(label: Text('500k - 1 triệu')),
                  Chip(label: Text('Trên 1 triệu')),
                ],
              ),
              const SizedBox(height: 16),
              const Text('Cấp độ', style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Wrap(
                spacing: 8,
                children: [
                  Chip(label: Text('Tất cả')),
                  Chip(label: Text('Cơ bản')),
                  Chip(label: Text('Trung cấp')),
                  Chip(label: Text('Nâng cao')),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('Áp dụng bộ lọc'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
