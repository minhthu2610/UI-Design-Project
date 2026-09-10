# Yêu cầu thiết kế lại chức năng Tạo khóa học mới

## 1. Mục tiêu

Thiết kế lại trang **Tạo và chỉnh sửa khóa học** theo dạng quy trình nhiều bước (Stepper/Wizard), thay vì để toàn bộ thông tin khóa học trên một trang.

Quy trình gồm 3 bước:

1. Thiết lập thông tin cơ bản khóa học
2. Thêm đề cương và tài nguyên bài giảng
3. Gửi xét duyệt khóa học

Thiết kế cần giữ nguyên phong cách giao diện hiện tại của hệ thống giáo viên.

---

# 2. Cấu trúc Stepper

Hiển thị thanh tiến trình ở phía trên khu vực nội dung, tương tự quy trình đăng ký thi của IIG.

```text
┌─────────────────────────────────────────────────────────────────────┐
│                                                                     │
│  Bước 1                  Bước 2                   Bước 3           │
│  Thiết lập thông tin  →  Thêm đề cương và tài  →  Gửi xét duyệt    │
│  khóa học                 nguyên bài giảng         khóa học         │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

### Trạng thái Stepper

- Bước hiện tại: màu primary của hệ thống.
- Bước đã hoàn thành: màu xanh hoặc màu primary nhạt.
- Bước chưa thực hiện: màu xám.
- Người dùng không được phép bỏ qua bước bắt buộc.
- Có thể quay lại bước trước để chỉnh sửa.

---

# 3. BƯỚC 1 – THIẾT LẬP THÔNG TIN CƠ BẢN KHÓA HỌC

## Tiêu đề Stepper

```text
Bước 1: Thiết lập thông tin cơ bản khóa học
```

## Mục đích

Giáo viên nhập các thông tin cơ bản cần thiết trước khi xây dựng nội dung khóa học.

## Các trường thông tin

### Thông tin khóa học

| Trường | Bắt buộc |
|---|---|
| Tiêu đề khóa học | Có |
| Mô tả ngắn | Có |
| Mô tả chi tiết | Có |
| Danh mục đào tạo | Có |
| Cấp độ học viên | Có |
| Ngôn ngữ giảng dạy | Có |
| Hình ảnh đại diện khóa học | Có |
| Giá bán gốc | Có |
| Giá khuyến mãi | Không |

### Cấp độ học viên

Dropdown:

- Người mới bắt đầu
- Trung cấp
- Nâng cao
- Tất cả cấp độ

### Ngôn ngữ

Dropdown:

- Tiếng Việt
- Tiếng Anh
- Khác

### Ảnh bìa khóa học

Yêu cầu:

- Định dạng: JPG, JPEG, PNG
- Tỷ lệ khuyến nghị: 16:9
- Kích thước khuyến nghị: 1280 × 720px

Hiển thị khu vực:

```text
┌──────────────────────────────┐
│                              │
│           🖼️                 │
│                              │
│      Bấm để tải ảnh lên      │
│       hoặc kéo thả vào đây   │
│                              │
└──────────────────────────────┘
```

Sau khi upload thành công hiển thị ảnh preview.

## Nút điều hướng

Phía cuối trang:

```text
[ Hủy ]     [ Lưu bản nháp ]     [ Tiếp tục → ]
```

### Chức năng

#### Hủy

- Hiển thị hộp thoại xác nhận.
- Nếu đồng ý, quay về trang Quản lý khóa học.

#### Lưu bản nháp

- Lưu toàn bộ dữ liệu đã nhập.
- Trạng thái khóa học: `Bản nháp`.

#### Tiếp tục

Hệ thống kiểm tra các trường bắt buộc:

- Tiêu đề khóa học.
- Mô tả.
- Danh mục.
- Cấp độ.
- Giá bán.
- Ảnh bìa.

Nếu thiếu:

```text
Vui lòng hoàn thiện các thông tin bắt buộc trước khi tiếp tục.
```

Nếu hợp lệ, chuyển sang Bước 2.

---

# 4. BƯỚC 2 – THÊM ĐỀ CƯƠNG VÀ TÀI NGUYÊN BÀI GIẢNG

## Tiêu đề

```text
Bước 2: Thêm đề cương và tài nguyên bài giảng
```

## Mục đích

Giáo viên xây dựng cấu trúc nội dung khóa học thông qua:

- Chương.
- Bài học.
- Video bài giảng.
- Tài liệu học tập.

## 4.1 Cấu trúc đề cương

Giao diện hiển thị dạng danh sách có thể mở rộng.

Ví dụ:

```text
ĐỀ CƯƠNG KHÓA HỌC

Chương 1: Giới thiệu về khóa học
│
├── Bài 1: Tổng quan khóa học
│   ├── Video bài giảng
│   └── Tài liệu PDF
│
├── Bài 2: Kiến thức nền tảng
│   ├── Video bài giảng
│   └── Tài liệu đính kèm
│
└── + Thêm bài học


Chương 2: Nội dung chuyên sâu
│
├── Bài 1: ...
│
└── + Thêm bài học


[ + Thêm chương ]
```

## 4.2 Chức năng quản lý Chương

Mỗi chương có:

- Tên chương.
- Mô tả ngắn (tùy chọn).
- Danh sách bài học.

Nút thao tác:

```text
[ + Thêm bài học ]
[ Chỉnh sửa ]
[ Xóa ]
```

Giáo viên có thể:

- Thêm chương.
- Đổi tên chương.
- Xóa chương.
- Sắp xếp thứ tự chương.

## 4.3 Chức năng quản lý Bài học

Mỗi bài học thuộc một chương.

Thông tin bài học:

| Trường | Bắt buộc |
|---|---|
| Tiêu đề bài học | Có |
| Loại nội dung | Có |
| Video bài giảng | Có |
| Tài liệu đính kèm | Không |

Loại nội dung có thể bao gồm:

- Video bài giảng.
- Bài đọc.
- Tài liệu.
- Bài kiểm tra.

Tuy nhiên, đối với quy trình hiện tại, ưu tiên chính là:

```text
Video bài giảng + Tài liệu đính kèm
```

## 4.4 Upload Video bài giảng

Khi giáo viên thêm video:

```text
┌────────────────────────────────────────────┐
│                                            │
│                  🎥                        │
│                                            │
│         Kéo thả video vào đây              │
│                 hoặc                       │
│           [ Chọn video ]                   │
│                                            │
└────────────────────────────────────────────┘
```

## Quy định video

Hệ thống cần kiểm tra:

### Định dạng

Chấp nhận:

- `.mp4`
- `.webm`
- `.mov`

Không chấp nhận các định dạng khác.

### Dung lượng

Dung lượng video tối đa:

```text
2GB – 4GB tùy theo cấu hình hệ thống.
```

Thiết kế mặc định:

```text
Dung lượng tối đa: 4GB/video
```

### Độ phân giải

- Tối thiểu: 720p.
- Khuyến nghị: 1080p.

### Tỷ lệ khung hình

Khuyến nghị:

```text
16:9
```

## 4.5 Hiển thị trạng thái upload

Trong quá trình tải:

```text
Đang tải video...

██████████████████░░░░  85%

Tên file: bai-giang-01.mp4
Dung lượng: 1.2GB / 1.5GB

[ Hủy tải lên ]
```

Sau khi thành công:

```text
✓ Video đã tải lên thành công

bai-giang-01.mp4

[ Xem trước ] [ Thay thế ] [ Xóa ]
```

## 4.6 Tài nguyên học tập

Giáo viên có thể đính kèm:

- PDF.
- Word.
- PowerPoint.
- ZIP.
- Source Code.

Giao diện:

```text
TÀI NGUYÊN ĐÍNH KÈM

📄 Tai-lieu-bai-1.pdf
   2.4 MB

📄 Source-code.zip
   5.1 MB

[ + Thêm tài nguyên ]
```

Các thao tác:

- Tải lên.
- Tải xuống.
- Xóa.
- Thay thế.

## 4.7 Validation tại Bước 2

Khi nhấn:

```text
Tiếp tục →
```

Hệ thống kiểm tra:

### Điều kiện bắt buộc

Khóa học phải có:

- Ít nhất 1 chương.
- Mỗi chương phải có ít nhất 1 bài học.
- Khóa học phải có ít nhất 1 video bài giảng.

Nếu chưa có video:

Hiển thị cảnh báo:

```text
⚠ Khóa học chưa có video bài giảng.

Vui lòng thêm ít nhất một video bài giảng trước khi gửi xét duyệt.
```

Không hiển thị popup chuyển hướng như thiết kế cũ.

Không tự động chuyển sang màn hình khác.

Hiển thị lỗi trực tiếp tại Step 2.

---

# 5. BƯỚC 3 – GỬI XÉT DUYỆT KHÓA HỌC

## Tiêu đề

```text
Bước 3: Gửi xét duyệt khóa học
```

## Mục đích

Cho phép giáo viên xem lại toàn bộ thông tin khóa học trước khi gửi yêu cầu xét duyệt đến Admin.

## 5.1 Trang tổng quan trước khi gửi duyệt

Hiển thị thông tin tóm tắt:

```text
XEM LẠI THÔNG TIN KHÓA HỌC
```

### Thông tin cơ bản

```text
Tên khóa học:
Xây dựng hệ thống Microservices với NestJS và Kafka

Danh mục:
Lập trình & CNTT

Cấp độ:
Người mới bắt đầu

Giá bán:
890.000 VNĐ
```

Nút:

```text
[ Chỉnh sửa ]
```

Bấm vào sẽ quay về Bước 1.

### Nội dung khóa học

```text
NỘI DUNG KHÓA HỌC

Số chương: 3

Số bài học: 12

Số video bài giảng: 12

Số tài liệu đính kèm: 8
```

Nút:

```text
[ Chỉnh sửa đề cương ]
```

Bấm vào sẽ quay về Bước 2.

## 5.2 Kiểm tra điều kiện gửi xét duyệt

Trước khi gửi, hệ thống kiểm tra:

### Thông tin cơ bản

- Đã có tiêu đề.
- Đã có mô tả.
- Đã chọn danh mục.
- Đã chọn cấp độ.
- Đã có ảnh bìa.
- Giá bán hợp lệ.

### Nội dung

- Có ít nhất 1 chương.
- Có bài học.
- Có ít nhất 1 video.
- Video đúng định dạng.
- Video không vượt quá dung lượng.
- Video đáp ứng độ phân giải tối thiểu.

## 5.3 Checklist kiểm tra

Hiển thị trực quan:

```text
KIỂM TRA ĐIỀU KIỆN XUẤT BẢN

✓ Thông tin khóa học đầy đủ

✓ Đã tải ảnh bìa

✓ Có đề cương khóa học

✓ Có bài học

✓ Có video bài giảng

✓ Video đáp ứng yêu cầu kỹ thuật

✓ Giá bán hợp lệ
```

Nếu có lỗi:

```text
✓ Thông tin khóa học đầy đủ

✓ Đã tải ảnh bìa

✓ Có đề cương khóa học

✕ Chưa có video bài giảng
```

Nút gửi xét duyệt bị vô hiệu hóa nếu chưa đáp ứng điều kiện.

## 5.4 Gửi xét duyệt

Nút chính:

```text
[ ← Quay lại ]        [ Lưu bản nháp ]       [ Gửi xét duyệt ]
```

Khi giáo viên nhấn:

```text
Gửi xét duyệt
```

Hiển thị modal xác nhận:

```text
Gửi yêu cầu xét duyệt?

Khóa học sẽ được chuyển đến quản trị viên để kiểm duyệt.

Trong thời gian chờ xét duyệt, bạn có thể theo dõi trạng thái
khóa học trong trang Quản lý khóa học.

[ Hủy ]        [ Xác nhận gửi ]
```

## 5.5 Sau khi gửi thành công

Hệ thống:

1. Cập nhật trạng thái khóa học thành `Chờ kiểm duyệt`.
2. Tạo yêu cầu kiểm duyệt.
3. Gửi thông báo đến Admin.
4. Hiển thị thông báo thành công.

Giao diện:

```text
✓ Gửi yêu cầu xét duyệt thành công

Khóa học của bạn đang chờ quản trị viên kiểm duyệt.

Bạn sẽ nhận được thông báo khi khóa học được phê duyệt
hoặc yêu cầu chỉnh sửa.
```

Nút:

```text
[ Quay về Quản lý khóa học ]
```

---

# 6. Trạng thái khóa học

Hệ thống sử dụng các trạng thái sau:

| Trạng thái | Ý nghĩa |
|---|---|
| Bản nháp | Giáo viên đang xây dựng khóa học |
| Chờ kiểm duyệt | Đã gửi yêu cầu đến Admin |
| Yêu cầu chỉnh sửa | Admin từ chối và yêu cầu chỉnh sửa |
| Đã xuất bản | Khóa học được phê duyệt |
| Tạm ẩn | Khóa học không hiển thị công khai |

---

# 7. Luồng xử lý tổng thể

```text
GIÁO VIÊN

        │
        ▼

┌───────────────────────┐
│ BƯỚC 1                │
│ Thiết lập thông tin   │
│ cơ bản khóa học       │
└───────────┬───────────┘
            │
            ▼

┌───────────────────────┐
│ BƯỚC 2                │
│ Thêm đề cương và      │
│ tài nguyên bài giảng  │
└───────────┬───────────┘
            │
            │ Kiểm tra
            ▼

      ┌─────────────┐
      │ Hợp lệ?     │
      └──────┬──────┘
         Không│     │Có
             │     │
             ▼     ▼
      Hiển thị lỗi  Bước 3

                    │
                    ▼

┌───────────────────────┐
│ BƯỚC 3                │
│ Xem lại và gửi        │
│ xét duyệt             │
└───────────┬───────────┘
            │
            ▼

      GỬI ADMIN DUYỆT

            │
            ▼

      Trạng thái:
      CHỜ KIỂM DUYỆT
```

---

# 8. Yêu cầu thiết kế giao diện

## Giữ nguyên

- Sidebar giáo viên hiện tại.
- Header hiện tại.
- Font hiện tại.
- Màu sắc thương hiệu hiện tại.
- Card và border radius hiện tại.

## Cần thay đổi

Trang tạo khóa học hiện tại đang hiển thị toàn bộ form trên một màn hình.

Hãy chuyển thành:

```text
Sidebar
│
├── Header
│
└── Stepper
    │
    ├── Bước 1
    │
    ├── Bước 2
    │
    └── Bước 3
```

---

# 9. Yêu cầu UX quan trọng

Không sử dụng popup để yêu cầu giáo viên chuyển sang trang khác khi khóa học thiếu video.

Thiết kế cũ:

```text
"Khóa học chưa có video bài giảng.
Bạn có muốn chuyển sang màn hình Tải video không?"
```

Thiết kế mới:

Giáo viên luôn nhìn thấy quy trình Stepper.

Nếu đang ở Bước 1 và chưa hoàn thành nội dung:

```text
Bước 1 → Bước 2
```

Nếu đang ở Bước 2 và chưa có video:

Hiển thị validation trực tiếp:

```text
⚠ Khóa học cần có ít nhất một video bài giảng
trước khi có thể gửi xét duyệt.
```

Người dùng không bị chuyển hướng bất ngờ.

---

# 10. Responsive

Thiết kế ưu tiên Desktop vì đây là Dashboard dành cho giáo viên.

Tuy nhiên cần responsive cho:

- Tablet.
- Laptop 1366px.
- Desktop 1920px.

Ở màn hình nhỏ:

Stepper có thể hiển thị:

```text
Bước 1 / 3

Thiết lập thông tin khóa học

─────────────── 33%
```

---

# 11. Kết quả mong muốn

Sau khi cập nhật, chức năng tạo khóa học sẽ có trải nghiệm giống một quy trình rõ ràng:

```text
1. Nhập thông tin
        ↓
2. Xây dựng nội dung
        ↓
3. Kiểm tra và gửi duyệt
```

Thay vì giáo viên phải tự đoán:

- Cần làm gì trước.
- Cần tải video ở đâu.
- Khi nào có thể gửi xét duyệt.

Giao diện phải giúp giáo viên biết rõ mình đang ở bước nào và còn thiếu điều kiện gì trước khi xuất bản khóa học.
