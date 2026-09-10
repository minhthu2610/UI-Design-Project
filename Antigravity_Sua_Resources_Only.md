# YÊU CẦU ANTIGRAVITY — SỬA `resources.html`

## Mục tiêu

Chỉ sửa **trang Thư viện tài nguyên** để khớp với:
- Luồng frontend hiện tại.
- UC10 trong báo cáo KLCN044.
- CSDL `QL_HETHONG_CUNGCAP_KHOAHOC.sql`.

**Không sửa luồng Đề cương & Video. Không sửa sidebar. Không sửa CSDL.**

---

## 1. Luồng hiện tại đã đúng — KHÔNG ĐƯỢC ĐỔI

`Đề cương & Video` hiện **không nằm trong sidebar**.

Luồng đúng hiện tại là:

`Quản lý khóa học`
→ `Chi tiết khóa học`
→ `Đề cương & Video`
→ `Chương`
→ `Bài học`
→ `Video`
→ `Tài nguyên`

Giữ nguyên luồng này.

Trong `curriculum.html`, tài nguyên được thêm tại từng bài học thông qua chức năng **Đính kèm tài liệu**.

**Không chuyển chức năng này sang sidebar hoặc sang một luồng upload độc lập.**

---

## 2. Sidebar hiện tại — KHÔNG ĐỔI

Giữ nguyên sidebar giáo viên:

1. Dashboard tổng quan
2. Quản lý khóa học
3. Thư viện tài nguyên
4. Quản lý học viên
5. Báo cáo thống kê
6. Nhận thanh toán

Không thêm `Đề cương & Video` vào sidebar.

---

## 3. Vấn đề cần sửa trong `resources.html`

Trang `resources.html` hiện đang cho phép:

> `+ Tải lên tệp mới`

sau đó:

> `Chọn khóa học áp dụng (Tùy chọn)`

và có:

> `Tài nguyên tự do (Chưa gắn khóa học)`

Ngoài ra bảng còn có dữ liệu:

> `Tệp tự do (Chưa gắn)`

Đây là phần cần loại bỏ.

---

## 4. Khớp với CSDL

CSDL hiện tại có quan hệ:

`KhoaHoc → ChuongHoc → BaiHoc → TaiNguyen`

Trong đó `TaiNguyen` gắn với `BaiHoc` thông qua `maBaiHoc`.

Vì vậy:

- Không có tài nguyên "tự do".
- Không có tài nguyên chỉ gắn với khóa học mà không gắn bài học.
- Mỗi tài nguyên phải thuộc một **Bài học cụ thể**.
- Không tạo bảng/cột/quan hệ CSDL mới.

---

## 5. Cách sửa `resources.html`

### 5.1. Giữ nguyên chức năng Thư viện

Trang vẫn là:

**Thư viện tài nguyên tập trung**

Dùng để:
- xem danh sách tài nguyên;
- tìm kiếm theo tên;
- lọc theo loại;
- lọc theo khóa học;
- xem tài nguyên;
- tải tài nguyên;
- xóa/quản lý tài nguyên nếu phù hợp.

Có thể giữ bảng:

- Tên tệp
- Loại tệp
- Khóa học sử dụng
- Bài học liên quan
- Dung lượng
- Ngày tải lên
- Thao tác

---

### 5.2. Bỏ tài nguyên tự do

Xóa hoàn toàn:

- option `Tài nguyên tự do (Chưa gắn khóa học)`;
- filter `unused`;
- các dòng mock có `data-course="unused"`;
- text `Tệp tự do (Chưa gắn)`;
- mọi logic cho phép tài nguyên không có bài học.

Không để trạng thái:

`Chưa gắn`

trong bảng tài nguyên.

---

### 5.3. Xử lý nút `+ Tải lên tệp mới`

**Ưu tiên: bỏ nút `+ Tải lên tệp mới` khỏi `resources.html`.**

Lý do: theo UC10, tài nguyên mới được thêm trong ngữ cảnh của một bài học:

`Khóa học`
→ `Chương`
→ `Bài học`
→ `Đính kèm tài nguyên`

Thư viện chỉ là nơi quản lý/tổng hợp các tài nguyên đã tồn tại.

Thay khu vực nút upload bằng một CTA phù hợp, ví dụ:

> `Để thêm tài nguyên mới, hãy vào Quản lý khóa học → chọn khóa học → Đề cương & Video → chọn bài học → Đính kèm tài nguyên.`

Có thể thêm nút:

> `Đi tới Quản lý khóa học`

Nút này dẫn đến `courses.html`.

---

## 6. Không thay đổi `curriculum.html`

Không sửa logic hiện tại của `curriculum.html` về:

- tạo chương;
- tạo bài học;
- tải video;
- thay video;
- cho phép xem thử;
- đính kèm tài liệu;
- lưu & gửi duyệt.

Luồng này đã đúng với UC10.

---

## 7. Mock data trong `resources.html`

Các resource mock còn lại phải luôn thể hiện đầy đủ:

- `courseId`
- `lessonId`
- tên file
- loại file
- dung lượng
- ngày tải lên

Ví dụ logic:

```text
Video:
Khóa học: HTML5 & Vanilla JS
Bài học: Bài 1.1: Giới thiệu HTML5

PDF:
Khóa học: HTML5 & Vanilla JS
Bài học: Bài 1.1: Giới thiệu HTML5
```

Không tạo resource có:

```text
courseId = unused
lessonId = null
```

hoặc trạng thái tương đương.

---

## 8. Video và tài liệu

Có thể tiếp tục hiển thị cả:

- Video bài giảng
- PDF
- ZIP
- Source Code

trong Thư viện tài nguyên để giáo viên dễ quản lý.

Nhưng đây chỉ là **giao diện tổng hợp**.

Không biến video thành `TaiNguyen` nếu CSDL hiện tại không quy định như vậy.

Logic dữ liệu vẫn là:

`BaiHoc`
- video bài giảng

`TaiNguyen`
- tài liệu đính kèm của bài học

---

## 9. Không được làm

TUYỆT ĐỐI KHÔNG:

- sửa SQL;
- thêm bảng;
- thêm cột;
- thêm entity mới;
- thêm `ResourceLibrary` vào CSDL;
- đưa `Đề cương & Video` vào sidebar;
- thay đổi luồng `Quản lý khóa học → Chi tiết khóa học → Đề cương & Video`;
- cho phép tài nguyên tự do;
- cho phép tài nguyên chỉ gắn khóa học mà không gắn bài học;
- tạo upload tài nguyên độc lập khỏi bài học;
- sửa các chức năng giáo viên khác.

---

## 10. Acceptance Criteria

Sau khi sửa, phải đạt:

### Sidebar

```text
Dashboard
Quản lý khóa học
Thư viện tài nguyên
Quản lý học viên
Báo cáo thống kê
Nhận thanh toán
```

### Upload tài nguyên

```text
Quản lý khóa học
→ Chi tiết khóa học
→ Đề cương & Video
→ Chương
→ Bài học
→ Đính kèm tài nguyên
```

### Thư viện tài nguyên

```text
Thư viện tài nguyên
→ xem / tìm kiếm / lọc / quản lý
→ tài nguyên đã được gắn với bài học
```

### Quan hệ dữ liệu

```text
KhoaHoc
   ↓
ChuongHoc
   ↓
BaiHoc
   ↓
TaiNguyen
```

Mọi tài nguyên trong mock UI đều phải có khóa học và bài học liên quan.

---

## 11. File cần sửa

**Chỉ ưu tiên sửa:**

`pages/instructor/resources.html`

Không cần sửa:

- `curriculum.html`
- `courses.html`
- `course-detail.html`
- SQL database

trừ khi phát hiện một lỗi navigation trực tiếp liên quan đến `resources.html`.

## 12. Yêu cầu cuối

Hãy sửa trực tiếp file hiện tại, **giữ nguyên style/UI design đang có**, chỉ thay đổi những phần cần thiết để loại bỏ "tài nguyên tự do" và đảm bảo trang `resources.html` phù hợp với CSDL + UC10.

**Không rebuild project. Không tự suy diễn nghiệp vụ mới.**
