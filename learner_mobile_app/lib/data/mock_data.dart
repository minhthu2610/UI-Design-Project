import 'models/category_model.dart';
import 'models/course_model.dart';
import 'models/lesson_model.dart';
import 'models/resource_model.dart';
import 'models/review_model.dart';
import 'models/user_model.dart';

class MockData {
  // Mock Student Users
  static const UserModel currentUser = UserModel(
    id: 1,
    fullName: 'Minh Thư',
    email: 'minhthu@gmail.com',
    role: 'HocVien',
    avatar: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=150',
    phone: '0987654321',
    gender: 'Nữ',
    birthDate: '2002-10-26',
  );

  // Mock Categories
  static const List<CategoryModel> categories = [
    CategoryModel(id: 'cat-1', name: 'Lập trình Web', count: 48, code: 'WEB', icon: '💻'),
    CategoryModel(id: 'cat-2', name: 'Cơ sở dữ liệu', count: 32, code: 'DB', icon: '🗄️'),
    CategoryModel(id: 'cat-3', name: 'Trí tuệ nhân tạo', count: 24, code: 'AI', icon: '🤖'),
    CategoryModel(id: 'cat-4', name: 'Lập trình Mobile', count: 19, code: 'MOB', icon: '📱'),
    CategoryModel(id: 'cat-5', name: 'Thiết kế UI/UX', count: 26, code: 'DSG', icon: '🎨'),
  ];

  // Mock Chapters & Lessons for KH01
  static const List<ChapterModel> chaptersKH01 = [
    ChapterModel(
      id: 'ch-1',
      title: 'Chương 1: Tổng quan & Cấu trúc Dự án ASP.NET MVC',
      order: 1,
      lessons: [
        LessonModel(
          id: 'les-1',
          title: 'Bài 1.1: Giới thiệu Mô hình MVC Architecture',
          durationSeconds: 900,
          videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
          isPreviewAllowed: true,
          isCompleted: true,
          stoppedAtSeconds: 900,
          resources: [
            ResourceModel(
              id: 'res-1',
              title: 'Slide_Giới_thiệu_MVC_Model.pdf',
              type: 'PDF',
              url: 'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
              fileSize: '4.2 MB',
            ),
          ],
        ),
        LessonModel(
          id: 'les-2',
          title: 'Bài 1.2: Thiết lập Controller và View cơ bản',
          durationSeconds: 1450,
          videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
          isPreviewAllowed: false,
          isCompleted: true,
          stoppedAtSeconds: 1450,
        ),
      ],
    ),
    ChapterModel(
      id: 'ch-2',
      title: 'Chương 2: Entity Framework & SQL Server Integration',
      order: 2,
      lessons: [
        LessonModel(
          id: 'les-3',
          title: 'Bài 2.1: Entity Framework Core Code-First Flow',
          durationSeconds: 1800,
          videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
          isPreviewAllowed: false,
          isCompleted: false,
          stoppedAtSeconds: 650,
          resources: [
            ResourceModel(
              id: 'res-2',
              title: 'SourceCode_DbContext_Init.zip',
              type: 'ZIP',
              url: '#',
              fileSize: '12.8 MB',
            ),
          ],
        ),
        LessonModel(
          id: 'les-4',
          title: 'Bài 2.2: Tối ưu SQL Query với Stored Procedures & Triggers',
          durationSeconds: 2100,
          isPreviewAllowed: false,
          isCompleted: false,
          stoppedAtSeconds: 0,
        ),
      ],
    ),
  ];

  // Mock Reviews
  static const List<ReviewModel> mockReviews = [
    ReviewModel(
      id: 'rev-1',
      studentName: 'Nguyễn Văn Nam',
      studentAvatar: 'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
      rating: 5,
      comment: 'Khóa học giảng dạy rất dễ hiểu, đúng thực tế dự án doanh nghiệp!',
      date: '02/09/2026',
    ),
    ReviewModel(
      id: 'rev-2',
      studentName: 'Trần Thị Mai',
      studentAvatar: null,
      rating: 5,
      comment: 'Video sắc nét, hỗ trợ tài liệu mã nguồn đầy đủ.',
      date: '05/09/2026',
    ),
  ];

  // All Courses (including Draft)
  static final List<CourseModel> allCourses = [
    CourseModel(
      id: 'KH01',
      title: 'Lập trình ASP.NET MVC & SQL Server Chuyên Sâu',
      categoryId: 'cat-1',
      categoryName: 'Lập trình Web',
      instructorName: 'ThS. Phạm Quốc Huy',
      rating: 4.9,
      reviewCount: 340,
      price: 990000,
      originalPrice: 1200000,
      coverImage: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?w=600',
      level: 'Trung cấp',
      duration: '32 giờ',
      lessonsCount: 45,
      status: 'Đã xuất bản',
      shortDescription: 'Thành thạo kiến trúc ASP.NET MVC kết nối CSDL SQL Server và Entity Framework.',
      fullDescription: 'Khóa học cung cấp kiến thức toàn diện từ thiết kế cơ sở dữ liệu SQL Server, viết Stored Procedure, Triggers cho tới tích hợp REST API và xây dựng hệ thống Web chuẩn Clean Architecture.',
      learningOutcomes: '• Thành thạo C# & ASP.NET MVC\n• Kết nối SQL Server qua EF Core & Stored Procedures\n• Bảo mật JWT & Xây dựng REST API',
      isEnrolled: true,
      isCompleted: false,
      progress: 65.0,
      lastAccessedLesson: 'Bài 2.1: Entity Framework Core Code-First Flow',
      recommendationScore: 0.95,
      recommendationReason: 'Phù hợp với lộ trình học Lập trình Web của bạn',
      chapters: chaptersKH01,
      reviews: mockReviews,
    ),
    CourseModel(
      id: 'KH02',
      title: 'HTML5, CSS3 & Bootstrap 5 Thiết Kế Giao Diện Web',
      categoryId: 'cat-1',
      categoryName: 'Lập trình Web',
      instructorName: 'ThS. Nguyễn Văn An',
      rating: 4.8,
      reviewCount: 280,
      price: 650000,
      originalPrice: 900000,
      coverImage: 'https://images.unsplash.com/photo-1581291518857-4e27b48ff24e?w=600',
      level: 'Cơ bản',
      duration: '24 giờ',
      lessonsCount: 30,
      status: 'Đã xuất bản',
      shortDescription: 'Xây dựng giao diện Web chuẩn Responsive tương thích mọi thiết bị.',
      recommendationScore: 0.92,
      recommendationReason: 'Được đề xuất dựa trên các khóa học bạn đã học',
    ),
    CourseModel(
      id: 'KH03',
      title: 'Cơ Sở Dữ Liệu SQL Server Từ Cơ Bản Đến Nâng Cao',
      categoryId: 'cat-2',
      categoryName: 'Cơ sở dữ liệu',
      instructorName: 'TS. Lê Hoàng Nam',
      rating: 4.95,
      reviewCount: 510,
      price: 850000,
      originalPrice: 1500000,
      coverImage: 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=600',
      level: 'Mọi cấp độ',
      duration: '40 giờ',
      lessonsCount: 55,
      status: 'Đã xuất bản',
      shortDescription: 'Lập trình T-SQL, Stored Procedure, Indexing và Tối ưu truy vấn CSDL.',
      isEnrolled: true,
      isCompleted: true,
      progress: 100.0,
      lastAccessedLesson: 'Bài 10: Tối ưu chỉ mục SQL Server',
    ),
    CourseModel(
      id: 'KH04',
      title: 'Nhập Môn Machine Learning & Phân Tích Dữ Liệu Thực Chiến',
      categoryId: 'cat-3',
      categoryName: 'Trí tuệ nhân tạo',
      instructorName: 'Trần Thị Mai Phương',
      rating: 4.85,
      reviewCount: 190,
      price: 1200000,
      originalPrice: 1800000,
      coverImage: 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=600',
      level: 'Nâng cao',
      duration: '36 giờ',
      lessonsCount: 42,
      status: 'Đã xuất bản',
      shortDescription: 'Ứng dụng Python, Scikit-learn và Thuật toán Collaborative Filtering.',
      recommendationScore: 0.88,
      recommendationReason: 'Gợi ý nổi bật trong tuần',
    ),
    // DRAFT COURSE - MUST BE HIDDEN IN PUBLISHED LISTS
    CourseModel(
      id: 'KH05',
      title: 'Lập Trình Python Cho Người Mới Bắt Đầu (Bản Nháp)',
      categoryId: 'cat-1',
      categoryName: 'Lập trình Web',
      instructorName: 'Phạm Thanh Bình',
      rating: 0.0,
      reviewCount: 0,
      price: 500000,
      coverImage: 'https://images.unsplash.com/photo-1526379879527-8559ecfcaec0?w=600',
      level: 'Cơ bản',
      duration: '15 giờ',
      lessonsCount: 20,
      status: 'Bản nháp', // DRAFT
      shortDescription: 'Khóa học đang biên soạn.',
    ),
  ];

  // Helper method to get only PUBLISHED courses
  static List<CourseModel> get publishedCourses {
    return allCourses.where((c) => c.status == 'Đã xuất bản').toList();
  }

  // Enrolled Courses for current user
  static List<CourseModel> get enrolledCourses {
    return publishedCourses.where((c) => c.isEnrolled).toList();
  }

  // Recommended Courses for current user (excluding enrolled ones)
  static List<CourseModel> get recommendedCourses {
    return publishedCourses
        .where((c) => !c.isEnrolled && c.recommendationScore != null)
        .toList();
  }
}
