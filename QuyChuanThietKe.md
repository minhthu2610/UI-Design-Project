# QUY CHUẨN THIẾT KẾ GIAO DIỆN HỆ THỐNG E-LEARNING (DESIGN SYSTEM)

Quy chuẩn áp dụng bắt buộc cho toàn bộ 22 chức năng trên nền tảng Website nhằm bảo đảm tính đồng bộ thị giác và trải nghiệm người dùng[cite: 2].

---

## 1. HỆ THỐNG BẢNG MÀU (COLOR SYSTEM)

* **Primary (Màu chủ đạo):** `#434CE8` (Electric Indigo) – Thanh điều hướng chính, nút bấm quan trọng (Primary CTA), trạng thái bài học đang phát, liên kết active[cite: 2].
* **Primary Hover / Active:** `#353EC4` (Deep Indigo) – Trạng thái tương tác rê chuột hoặc nhấn nút.
* **Primary Light / Tint:** `#EEF2FF` – Nền của các huy hiệu (Badge), tag danh mục, thông báo trạng thái nhẹ.
* **Background Canvas:** 
  * Nền toàn trang nội dung: `#F8FAFC` (Slate 50).
  * Vùng Hero / Banner: `#FFFFFF` kết hợp gradient chuyển sắc nhẹ.
* **Surface / Cards:** `#FFFFFF` (Bo góc mềm, đổ bóng nhẹ `box-shadow: 0 4px 20px -2px rgba(15, 23, 42, 0.05)`).
* **Text Colors:**
  * Tiêu đề chính (Heading 1, 2, 3): `#0F172A` (Slate 900)[cite: 2].
  * Nội dung thông thường (Body text): `#334155` (Slate 700).
  * Văn bản phụ, thời lượng, số lượt đánh giá: `#64748B` (Slate 500)[cite: 2].
  * Văn bản mờ / Placeholder: `#94A3B8` (Slate 400).
* **Borders / Separators:** `#E2E8F0` (Slate 200).
* **Status Badges:**
  * Hoàn thành / Đã xuất bản / Thành công: `#10B981` (Nền `#ECFDF5`)[cite: 2].
  * Đang xử lý / Chờ duyệt / Đánh giá sao: `#F59E0B` (Nền `#FFFBEB`)[cite: 2].
  * Lỗi / Từ chối duyệt / Đã hủy: `#EF4444` (Nền `#FEF2F2`)[cite: 2].

---

## 2. QUY CHUẨN TYPOGRAPHY

* **Phông chữ mặc định:** **Plus Jakarta Sans** (Hỗ trợ tiếng Việt đầy đủ).
* **Thang kích thước chữ:**
  * `H1` (Tiêu đề Banner Hero): `40px` | Font-weight: `800` (ExtraBold) | Line-height: `48px`.
  * `H2` (Tiêu đề phân mục, Dashboard): `24px` | Font-weight: `700` (Bold) | Line-height: `32px`[cite: 2].
  * `H3` (Tên thẻ khóa học, Tiêu đề Widget): `18px` | Font-weight: `600` (SemiBold) | Line-height: `24px`.
  * `Body 1` (Đoạn mô tả, nội dung bài học): `15px` | Font-weight: `400` (Regular) | Line-height: `24px`[cite: 2].
  * `Body 2` (Nhãn Input, Dữ liệu bảng): `14px` | Font-weight: `500` (Medium) | Line-height: `20px`[cite: 2].
  * `Caption` (Thời lượng, mốc giờ, tag): `12px` | Font-weight: `600` (SemiBold) | Line-height: `16px`.

---

## 3. LƯỚI BỐ CỤC & BO GÓC (GRID & RADII)

* **Khung hiển thị cơ sở:** Kích thước chiều ngang `1440px`, vùng làm việc nội dung an toàn `1280px`.
* **Lưới 12 cột (12-Column Layout Grid):**
  * Margin hai bên: `80px`.
  * Gutter (Khoảng cách giữa các cột): `24px`.
* **Thông số bo góc (Corner Radii):**
  * Tag, Pill Badge, Avatar: `rounded-full` (`9999px`).
  * Nút bấm (Button), Ô tìm kiếm, Input form: `rounded-xl` (`12px`).
  * Thẻ khóa học (Course Card), Bảng biểu: `rounded-2xl` (`16px`).
  * Khung Hero minh họa, Container lớn: `rounded-3xl` (`24px`).

---

## 4. QUY CHUẨN CÁC THÀNH PHẦN GIAO DIỆN CỐ ĐỊNH

### Header Navigation (76px)
* Logo: Icon cuốn sách cách điệu trong khung bo cong màu `#434CE8` + Chữ `E-Learning` (Bold 20px).
* Menu liên kết: Trang chủ, Khám phá, Danh mục.
* Thanh tìm kiếm: Bo góc 12px, nền `#F8FAFC`, icon kính lúp, placeholder *"Search courses, skills, or instructors"*[cite: 2].
* Action Buttons: Nút "Log in" (viền mảnh), Nút "Register" (Nền `#434CE8`, chữ trắng)[cite: 2].

### Course Card Component
* Khung nền trắng bo góc 16px, viền mỏng `#E2E8F0`.
* Ảnh bìa khóa học tỉ lệ 16:9 bo tròn góc trên.
* Huy hiệu môn học nền `#EEF2FF` chữ `#434CE8`.
* Tên khóa học tối đa 2 dòng, tên tác giả/giáo viên màu `#64748B`[cite: 2].
* Điểm số đánh giá kèm cụm 5 sao màu `#F59E0B`[cite: 2].
* Hàng giá tiền: Giá khuyến mãi đậm nét và giá gốc gạch ngang[cite: 2].