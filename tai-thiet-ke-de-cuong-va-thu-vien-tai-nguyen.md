# Yêu cầu tái thiết kế chức năng Đề cương & Video

## 1. Mục tiêu

Điều chỉnh lại cấu trúc chức năng khu vực Giáo viên để tránh việc trang **Đề cương & Video** hoạt động độc lập nhưng không xác định đang thao tác trên khóa học nào.

Tách rõ hai chức năng:

1. Xây dựng đề cương và bài giảng cho từng khóa học.
2. Quản lý tập trung các tệp tài nguyên đã tải lên.

---

## 2. Điều chỉnh Sidebar

Thay mục hiện tại:

`Đề cương và Video`

Thành:

`Thư viện tài nguyên`

Sidebar Giáo viên đề xuất:

- Dashboard tổng quan
- Quản lý khóa học
- Thư viện tài nguyên
- Quản lý học viên
- Báo cáo thống kê
- Nhận thanh toán

---

## 3. Quản lý đề cương thuộc về từng khóa học

Chức năng **Đề cương & Bài giảng** không còn là một trang độc lập trong Sidebar.

Luồng điều hướng:

`Quản lý khóa học`
→ `Chi tiết khóa học`
→ `Đề cương & Bài giảng`

Mỗi đề cương phải gắn với một khóa học cụ thể.

Cấu trúc:

Khóa học
- Chương
  - Bài học
    - Video bài giảng
    - Tài liệu đính kèm

---

## 4. Trang Chi tiết khóa học

Bổ sung trang Chi tiết khóa học làm màn hình trung gian.

Các khu vực:

- Thông tin tổng quan khóa học.
- Ảnh bìa.
- Danh mục, cấp độ, giá bán.
- Trạng thái khóa học.
- Số chương, số bài học và tổng thời lượng.

Các thao tác:

- Chỉnh sửa thông tin.
- Quản lý Đề cương & Bài giảng.
- Gửi xét duyệt.
- Xem học viên.
- Xem thống kê.

Tùy theo trạng thái khóa học:

### Bản nháp
Cho phép chỉnh sửa thông tin và xây dựng đề cương.

### Chờ duyệt
Hiển thị trạng thái chờ Admin kiểm duyệt.

### Đã xuất bản
Cho phép quản lý nội dung, học viên và xem thống kê.

---

## 5. Trang Đề cương & Bài giảng

Trang này chỉ được truy cập từ một khóa học cụ thể.

Header phải hiển thị rõ:

`Đề cương & Bài giảng`

`Khóa học: [Tên khóa học hiện tại]`

Cho phép:

- Thêm chương mới.
- Thêm bài học.
- Upload video bài giảng.
- Đính kèm tài liệu PDF/ZIP.
- Thiết lập cho phép xem thử.
- Chỉnh sửa hoặc xóa bài học.

Cấu trúc giao diện:

Chương 1
- Bài 1.1
- Bài 1.2

Chương 2
- Bài 2.1
- Bài 2.2

Mỗi bài học có thể chứa:

- Video.
- Tài liệu đính kèm.
- Thời lượng.
- Trạng thái xem thử.

---

## 6. Thư viện tài nguyên

Trang **Thư viện tài nguyên** là nơi quản lý tập trung tất cả file của giáo viên trên nhiều khóa học.

Chức năng:

- Xem toàn bộ video đã tải lên.
- Xem tài liệu PDF.
- Xem file ZIP hoặc Code.
- Tìm kiếm tài nguyên.
- Lọc theo khóa học.
- Lọc theo loại tệp.
- Xem dung lượng.
- Xóa tài nguyên không còn sử dụng.

Thông tin mỗi tài nguyên:

- Tên tệp.
- Loại tệp.
- Khóa học đang sử dụng.
- Bài học liên quan.
- Dung lượng.
- Ngày tải lên.

Có thể sử dụng dạng bảng hoặc card.

---

## 7. Phân biệt hai chức năng

### Đề cương & Bài giảng

Mục đích: Xây dựng nội dung học tập.

Quản lý:

- Chương.
- Bài học.
- Thứ tự nội dung.
- Video.
- Tài liệu.

Luôn thuộc về một khóa học cụ thể.

### Thư viện tài nguyên

Mục đích: Quản lý file tập trung.

Quản lý:

- Video.
- PDF.
- ZIP.
- Code.
- Dung lượng lưu trữ.

Có thể chứa tài nguyên của nhiều khóa học.

Không hiển thị cấu trúc chương và bài học phức tạp để tránh overload giao diện.

---

## 8. Luồng tổng thể

Quản lý khóa học
→ Chọn khóa học
→ Chi tiết khóa học
→ Đề cương & Bài giảng
→ Tạo Chương
→ Tạo Bài học
→ Gắn Video/Tài liệu

Song song:

Sidebar
→ Thư viện tài nguyên
→ Xem và quản lý toàn bộ file đã tải lên

---

## 9. Yêu cầu UX

- Giữ nguyên Design System hiện tại.
- Tone màu trắng/xám và xanh tím.
- Không làm thay đổi giao diện các chức năng khác.
- Trang Thư viện tài nguyên phải đơn giản, không biến thành một trang quản lý đề cương thứ hai.
- Luôn hiển thị khóa học hiện tại khi giáo viên đang chỉnh sửa đề cương.
- Các liên kết từ Quản lý khóa học sang Chi tiết khóa học và Đề cương phải hoạt động theo đúng ID khóa học.

## Kết luận

Không sử dụng Sidebar `Đề cương & Video` như một trang xây dựng đề cương độc lập.

Thay bằng `Thư viện tài nguyên`.

Chức năng xây dựng `Đề cương & Bài giảng` phải nằm trong phạm vi của từng khóa học cụ thể để đảm bảo đúng nghiệp vụ và tránh nhầm lẫn về dữ liệu.
