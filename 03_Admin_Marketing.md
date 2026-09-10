# ĐẶC TẢ GIAO DIỆN: PHÂN HỆ QUẢN TRỊ VIÊN & MARKETING
*Tài liệu bám sát đặc tả Use Case từ UC3, UC14 đến UC18*[cite: 2]

---

## I. MỤC 3.3.1.1: GIAO DIỆN HỒ SƠ DÙNG CHUNG[cite: 2]

### 1. Chức năng Quản lý hồ sơ cá nhân (UC3)[cite: 2]
* **Tab Cập nhật thông tin cá nhân[cite: 2]:**
  * Vùng tải ảnh đại diện (Avatar tròn, hỗ trợ preview ảnh mới)[cite: 2].
  * Form dữ liệu: Họ và tên, Giới tính, Ngày sinh, Số điện thoại[cite: 2].
  * Nút "Lưu thay đổi": Báo đỏ trường tương ứng nếu nhập số điện thoại sai định dạng, thiếu thông tin bắt buộc, hoặc ảnh sai định dạng[cite: 2].
* **Tab Đổi mật khẩu[cite: 2]:**
  * Các trường: Mật khẩu hiện tại, Mật khẩu mới, Xác nhận mật khẩu mới[cite: 2].
  * Nút "Cập nhật mật khẩu": Kiểm tra đối chiếu và hiển thị lỗi nếu sai mật khẩu cũ, mật khẩu xác nhận không khớp, hoặc mật khẩu mới dưới 8 ký tự/thiếu ký tự bảo mật[cite: 2].

---

## II. MỤC 3.3.1.4: GIAO DIỆN NHÓM QUẢN TRỊ VIÊN (ADMIN)[cite: 2]

### 2. Trang Dashboard Quản trị viên[cite: 2]
* **4 Card thống kê tình hình vận hành toàn sàn[cite: 2]:**
  * Tổng doanh thu toàn hệ thống[cite: 2].
  * Tổng số người dùng (Học viên & Giáo viên).
  * Tổng số khóa học đang hoạt động.
  * Số lượng khóa học đang ở trạng thái "Chờ duyệt"[cite: 2].
* **Biểu đồ tổng hợp:** Biểu đồ tăng trưởng người dùng mới và lưu lượng truy cập hệ thống.

### 3. Chức năng Quản lý danh mục khóa học (UC14)[cite: 2]
* **Bảng danh sách danh mục:** Mã danh mục, Tên danh mục, Số lượng khóa học trực thuộc, Cột thao tác (Sửa, Xóa)[cite: 2].
* **Modal Thêm / Sửa danh mục[cite: 2]:**
  * Form nhập Tên danh mục mới, Mô tả phân loại[cite: 2].
  * Phản hồi nghiệp vụ: Báo lỗi "Tên danh mục đã tồn tại" nếu trùng lặp[cite: 2].
* **Cảnh báo Xóa danh mục[cite: 2]:**
  * Nếu danh mục đang có một hoặc nhiều khóa học trực thuộc, hệ thống khóa thao tác xóa và hiển thị thông báo "Không thể xóa danh mục đang có khóa học sử dụng"[cite: 2].

### 4. Chức năng Kiểm duyệt khóa học (UC15)[cite: 2]
* **Bảng khóa học chờ kiểm duyệt:** Danh sách các khóa học ở trạng thái "Chờ duyệt", Cột Tên khóa, Tên giáo viên gửi, Ngày gửi yêu cầu, Nút "Kiểm duyệt"[cite: 2].
* **Màn hình Chi tiết nội dung kiểm duyệt[cite: 2]:**
  * Khung kiểm tra thông tin cơ bản, cấu trúc đề cương, xem trực tiếp video bài giảng và các file tài nguyên đính kèm[cite: 2].
  * Cụm nút quyết định:
    * Nút "Phê duyệt" (Màu xanh `#10B981`): Cập nhật trạng thái khóa học thành "Đã xuất bản"[cite: 2].
    * Nút "Từ chối" (Màu đỏ `#EF4444`): Bật popup yêu cầu Admin nhập lý do từ chối hoặc nội dung cần sửa để gửi thông báo về cho giáo viên[cite: 2].

### 5. Chức năng Xem báo cáo thống kê toàn bộ hệ thống (UC16)[cite: 2]
* **Bộ lọc báo cáo:** Lựa chọn khoảng thời gian (theo tháng, quý, năm) và loại dữ liệu cần phân tích[cite: 2].
* **Biểu đồ trực quan[cite: 2]:**
  * Biểu đồ đường kép: Tăng trưởng doanh thu và số lượng đơn hàng hoàn tất[cite: 2].
  * Biểu đồ tròn (Donut chart): Tỷ trọng doanh thu theo từng danh mục đào tạo.
* **Nút "Xuất báo cáo":** Hỗ trợ xuất dữ liệu ra file Excel hoặc PDF[cite: 2].

---

## III. MỤC 3.3.1.5: GIAO DIỆN NHÓM MARKETING[cite: 2]

### 6. Trang Dashboard Marketing[cite: 2]
* **Các thẻ chỉ số tiếp thị tổng quan[cite: 2]:**
  * Số chiến dịch khuyến mãi đang hoạt động[cite: 2].
  * Tổng lượt mã giảm giá đã sử dụng[cite: 2].
  * Doanh thu kích cầu thu về từ các mã khuyến mãi.
* **Biểu đồ hiệu quả:** Xu hướng sử dụng coupon và lượt đăng ký mới qua từng kênh tiếp thị.

### 7. Chức năng Quản lý mã giảm giá và khuyến mãi (UC17)[cite: 2]
* **Bảng danh sách chương trình khuyến mãi & Mã giảm giá[cite: 2]:**
  * Các cột: Tên chương trình, Mã code áp dụng, Mức ưu đãi (%), Thời gian áp dụng (Bắt đầu - Kết thúc), Trạng thái (Đang chạy, Tạm ngưng, Đã kết thúc)[cite: 2].
  * Các nút thao tác nhanh: Chỉnh sửa, Tạm ngưng, Kết thúc chương trình[cite: 2].
* **Biểu mẫu Khởi tạo chương trình mới[cite: 2]:**
  * Nhập Tên chương trình, Hình thức khuyến mãi, Mức giảm giá (%)[cite: 2].
  * Chọn các khóa học áp dụng chương trình (cho phép chọn tất cả hoặc chọn theo danh mục)[cite: 2].
  * Thiết lập thời gian hiệu lực và điều kiện áp dụng[cite: 2].
  * Nút "Kích hoạt chương trình": Báo lỗi nếu thiếu trường bắt buộc hoặc ngày kết thúc trước ngày bắt đầu[cite: 2].

### 8. Chức năng Xem thống kê và báo cáo Marketing (UC18)[cite: 2]
* **Bộ lọc chiến dịch:** Lựa chọn khoảng thời gian và chương trình khuyến mãi/mã giảm giá cụ thể cần đánh giá[cite: 2].
* **Bảng thống kê hiệu quả chi tiết[cite: 2]:**
  * Cột: Tên chương trình, Mã Coupon, Tổng số lượt dùng thực tế, Tổng số tiền đã chiết khấu giảm trừ, Tổng doanh thu ròng mang lại cho hệ thống[cite: 2].
* **Biểu đồ chuyển đổi:** Thể hiện tương quan giữa số người click mã và số lượng đơn hàng thanh toán thành công[cite: 2].