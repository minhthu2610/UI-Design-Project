# Yêu cầu thiết kế trang Chi tiết khóa học

## Mục tiêu
Bổ sung trang **Chi tiết khóa học** cho khu vực Giáo viên. Trang này là màn hình trung gian sau khi giáo viên chọn một khóa học trong **Quản lý khóa học**.

## Điều hướng
- Từ trang `Quản lý khóa học`, khi nhấn vào tên khóa học hoặc nút `Xem chi tiết` sẽ chuyển đến trang chi tiết.
- URL gợi ý: `pages/instructor/course-detail.html`.

## Thông tin hiển thị

### 1. Header
- Breadcrumb: Giáo viên / Quản lý khóa học / Chi tiết khóa học.
- Tên khóa học.
- Badge trạng thái: Bản nháp / Chờ duyệt / Đã xuất bản.

### 2. Thông tin tổng quan
Hiển thị:
- Ảnh bìa khóa học.
- Tên khóa học.
- Mô tả ngắn.
- Danh mục.
- Cấp độ.
- Giá bán.
- Số bài học.
- Tổng thời lượng.
- Số học viên.

### 3. Nội dung khóa học
Hiển thị danh sách Chương và Bài học theo dạng accordion:
- Chương 1, Chương 2...
- Mỗi bài học có tên, thời lượng và trạng thái video.
- Không cần phát video trực tiếp tại trang này.

### 4. Thanh thao tác
Tùy trạng thái khóa học:

**Bản nháp**
- Chỉnh sửa thông tin.
- Quản lý đề cương & bài giảng.
- Xóa khóa học.
- Gửi xét duyệt khi đủ điều kiện.

**Chờ duyệt**
- Xem thông tin.
- Hiển thị trạng thái đang chờ Admin kiểm duyệt.
- Không cho sửa nếu đã gửi duyệt.

**Đã xuất bản**
- Chỉnh sửa khóa học.
- Xem đề cương.
- Xem thống kê.
- Quản lý học viên.

## Liên kết với các trang hiện có
Luồng chính:

Quản lý khóa học
→ Chi tiết khóa học
→ Chỉnh sửa thông tin khóa học
→ Đề cương & Video

Không để mục `Đề cương và Video` hoạt động độc lập mà không biết đang thuộc khóa học nào. Khi giáo viên vào quản lý đề cương, phải truyền theo ID khóa học đang được chọn.

## Giao diện
- Giữ nguyên Design System hiện tại của giao diện Giáo viên.
- Sidebar giữ nguyên.
- Tone trắng/xám, màu primary xanh tím.
- Responsive theo desktop.
- Không thay đổi các trang hiện có, chỉ bổ sung liên kết và trang chi tiết.
