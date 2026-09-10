# ĐẶC TẢ GIAO DIỆN: PHÂN HỆ GIÁO VIÊN (INSTRUCTOR PORTAL)
*Tài liệu bám sát đặc tả Use Case từ UC9 đến UC13 và khung quản trị Master Layout*[cite: 2]

---

## I. KIẾN TRÚC LAYOUT DÙNG CHUNG PHÂN HỆ GIÁO VIÊN
Toàn bộ 6 màn hình giáo viên sử dụng chung bố cục:
* **Sidebar cố định bên trái (Rộng 260px, nền `#FFFFFF`, viền `#E2E8F0`):**
  * Logo E-Learning phía trên.
  * Thông tin giảng viên (Avatar, Tên, Chức danh).
  * Menu 6 mục tương ứng 6 chức năng.
* **Top Header:** Hiển thị breadcrumb điều hướng, chuông thông báo, và nút CTA nhanh "+ Tạo khóa học mới"[cite: 2].
* **Vùng nội dung bên phải:** Nền xám nhạt `#F8FAFC`, chứa nội dung chi tiết từng tab[cite: 2].

---

## II. CHI TIẾT 6 MÀN HÌNH CHỨC NĂNG (MỤC 3.3.1.3)[cite: 2]

### 1. Trang Dashboard Giáo viên[cite: 2]
* **4 Thẻ số liệu tổng quan (Metric Cards bo góc 16px):**
  * Tổng doanh thu tích lũy (VNĐ)[cite: 2].
  * Doanh thu trong tháng[cite: 2].
  * Tổng số học viên đã đăng ký[cite: 2].
  * Đánh giá trung bình (sao vàng `#F59E0B`)[cite: 2].
* **Biểu đồ doanh thu:** Biểu đồ đường (Line chart) thể hiện biến động doanh thu khóa học theo tháng[cite: 2].
* **Khối tóm tắt:** Danh sách 3 khóa học mang lại doanh thu cao nhất.

### 2. Chức năng Tạo và quản lý khóa học (UC9)[cite: 2]
* **Màn hình Quản lý danh sách:**
  * Bảng dữ liệu: Cột Ảnh đại diện, Tên khóa học, Danh mục, Giá bán, Số học viên, Trạng thái[cite: 2].
  * Nhãn trạng thái: "Bản nháp" (màu xám), "Chờ duyệt" (màu vàng cam `#F59E0B`), "Đã xuất bản" (màu xanh lá `#10B981`)[cite: 2].
  * Thao tác: Sửa nội dung, Xóa khóa học, và nút "Gửi duyệt xuất bản"[cite: 2].
* **Biểu mẫu Khởi tạo khóa học mới[cite: 2]:**
  * Các ô nhập: Tiêu đề khóa học, Mô tả tổng quan, Giá bán, Danh mục (Dropdown), Ảnh thu nhỏ (Thumbnail), Mục tiêu đầu ra[cite: 2].
  * Báo lỗi đỏ nếu bỏ trống trường bắt buộc hoặc nhập sai định dạng giá[cite: 2].
  * Cụm nút: "Lưu bản nháp" (Lưu trạng thái nháp) và "Gửi duyệt xuất bản" (Kiểm tra nếu chưa có video sẽ hiển thị cảnh báo "Khóa học không có nội dung")[cite: 2].

### 3. Chức năng Tải video tài liệu lên khóa (UC10)[cite: 2]
* **Giao diện Cây đề cương (Chương trình giảng dạy)[cite: 2]:**
  * Nút "+ Thêm chương mới" để tạo nhóm bài học[cite: 2].
  * Bên trong từng chương: Danh sách bài học và nút "+ Thêm bài học mới"[cite: 2].
* **Khu vực tải lên nội dung bài học cụ thể[cite: 2]:**
  * Khung tải video bài giảng: Drag-and-drop file `.mp4`, thanh phần trăm upload và trạng thái nén/encode HLS[cite: 2]. Báo lỗi nếu định dạng không hỗ trợ hoặc file vượt quá 2GB[cite: 2].
  * Khung thêm tài nguyên: Nút upload file đính kèm (`.pdf`, `.zip`, `.doc`) phục vụ học viên tải về[cite: 2].

### 4. Chức năng Quản lý học viên của khóa (UC11)[cite: 2]
* **Thanh công cụ lọc:** Dropdown chọn khóa học cụ thể, Ô tìm kiếm học viên theo Họ tên hoặc Email[cite: 2].
* **Bảng danh sách học viên[cite: 2]:**
  * Cột hiển thị: Họ và tên, Email, Ngày tham gia khóa học, Tiến độ hoàn thành (% kèm thanh Progress Bar), Đánh giá của học viên[cite: 2].
  * Màn hình rỗng: Hiển thị thông báo "Khóa học hiện tại chưa có học viên nào ghi danh" nếu khóa mới mở[cite: 2].
* **Popup chi tiết học viên:** Hiển thị lịch sử các mốc bài giảng mà học viên đã truy cập[cite: 2].

### 5. Chức năng Báo cáo thống kê khóa học (UC12)[cite: 2]
* **Tab Doanh thu & Lượt đăng ký[cite: 2]:**
  * Bộ lọc khoảng thời gian: "7 ngày qua", "Tháng này", "Năm nay"[cite: 2].
  * Biểu đồ đường (Line Chart) cập nhật dữ liệu doanh thu biến động theo bộ lọc thời gian[cite: 2].
  * Nút "Xuất dữ liệu" ra file Excel/CSV[cite: 2].
* **Tab Phân tích Đánh giá[cite: 2]:**
  * Điểm Rating trung bình toàn bộ khóa học[cite: 2].
  * Biểu đồ thanh ngang phân bổ số lượng đánh giá từ 1 sao đến 5 sao[cite: 2].

### 6. Chức năng Nhận thanh toán khóa học (UC13)[cite: 2]
* **Thẻ thông tin số dư:** Hiển thị "Số dư khả dụng có thể rút" và "Doanh thu đang chờ đối soát"[cite: 2].
* **Biểu mẫu Yêu cầu nhận thanh toán[cite: 2]:**
  * Ô nhập số tiền cần rút (Hiển thị cảnh báo nếu số dư chưa đạt ngưỡng doanh thu tối thiểu)[cite: 2].
  * Thông tin tài khoản nhận tiền: Tên ngân hàng, Số tài khoản, Tên chủ thẻ (Báo lỗi nếu thông tin không hợp lệ)[cite: 2].
  * Nút "Gửi yêu cầu nhận thanh toán"[cite: 2].
* **Bảng theo dõi lịch sử thanh toán:** Mã giao dịch, Ngày tạo yêu cầu, Số tiền, Trạng thái (Đang chờ xử lý, Đã chi trả, Thất bại cần xử lý lại)[cite: 2].