CREATE DATABASE QL_HETHONG_CUNGCAP_KHOAHOC;
USE QL_HETHONG_CUNGCAP_KHOAHOC;
GO


-- 1. BẢNG NGƯỜI DÙNG
CREATE TABLE NguoiDung (
    maNguoiDung INT IDENTITY(1,1) NOT NULL,
    hoTen NVARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    matKhau VARCHAR(255) NOT NULL,
    vaiTro NVARCHAR(30) NOT NULL, -- 'HocVien', 'GiaoVien', 'Admin', 'Marketing'
    trangThai BIT DEFAULT 1,
    ngaySinh DATE NULL,
    CONSTRAINT PK_NguoiDung PRIMARY KEY (maNguoiDung)
);

-- 2. BẢNG DANH MỤC KHÓA HỌC
CREATE TABLE DanhMuc (
    maDanhMuc VARCHAR(20) NOT NULL,
    tenDanhMuc NVARCHAR(100) NOT NULL,
    CONSTRAINT PK_DanhMuc PRIMARY KEY (maDanhMuc)
);

-- 3. BẢNG KHÓA HỌC
CREATE TABLE KhoaHoc (
    maKhoaHoc VARCHAR(20) NOT NULL,
    tenKhoaHoc NVARCHAR(255) NOT NULL,
    moTa NVARCHAR(MAX) NULL,
    giaBan DECIMAL(18, 2) NOT NULL DEFAULT 0,
    trangThai NVARCHAR(50) DEFAULT N'Bản nháp',
    maDanhMuc VARCHAR(20) NOT NULL,
    maGiaoVien INT NOT NULL,
    CONSTRAINT PK_KhoaHoc PRIMARY KEY (maKhoaHoc),
    CONSTRAINT FK_KhoaHoc_DanhMuc FOREIGN KEY (maDanhMuc) REFERENCES DanhMuc(maDanhMuc),
    CONSTRAINT FK_KhoaHoc_GiaoVien FOREIGN KEY (maGiaoVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT CHK_GiaBan CHECK (giaBan >= 0)
);

-- 4. BẢNG CHƯƠNG HỌC
CREATE TABLE ChuongHoc (
    maChuong VARCHAR(20) NOT NULL,
    tenChuong NVARCHAR(200) NOT NULL,
    thuTu INT DEFAULT 1,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_ChuongHoc PRIMARY KEY (maChuong),
    CONSTRAINT FK_ChuongHoc_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc) ON DELETE CASCADE
);

-- 5. BẢNG BÀI HỌC
CREATE TABLE BaiHoc (
    maBaiHoc VARCHAR(20) NOT NULL,
    tenBaiHoc NVARCHAR(200) NOT NULL,
    thoiLuong INT DEFAULT 0, -- Thời lượng tính theo giây
    thuTu INT DEFAULT 1,
    maChuong VARCHAR(20) NOT NULL,
    CONSTRAINT PK_BaiHoc PRIMARY KEY (maBaiHoc),
    CONSTRAINT FK_BaiHoc_ChuongHoc FOREIGN KEY (maChuong) REFERENCES ChuongHoc(maChuong) ON DELETE CASCADE
);

-- 6. BẢNG TÀI NGUYÊN (Tài liệu đính kèm)
CREATE TABLE TaiNguyen (
    maTaiNguyen VARCHAR(20) NOT NULL,
    tenTaiNguyen NVARCHAR(255) NOT NULL,
    loaiTaiNguyen NVARCHAR(50) NOT NULL,
    duongDan VARCHAR(500) NULL,
    maBaiHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_TaiNguyen PRIMARY KEY (maTaiNguyen),
    CONSTRAINT FK_TaiNguyen_BaiHoc FOREIGN KEY (maBaiHoc) REFERENCES BaiHoc(maBaiHoc) ON DELETE CASCADE
);

-- 7. BẢNG CHƯƠNG TRÌNH KHUYẾN MÃI
CREATE TABLE KhuyenMai (
    maKhuyenMai VARCHAR(20) NOT NULL,
    tenKhuyenMai NVARCHAR(150) NOT NULL,
    mucUuDai FLOAT NOT NULL,
    ngayBatDau DATETIME NOT NULL,
    ngayKetThuc DATETIME NOT NULL,
    dieuKienApDung NVARCHAR(255) NULL,
    maNhanVienMarketing INT NOT NULL,
    CONSTRAINT PK_KhuyenMai PRIMARY KEY (maKhuyenMai),
    CONSTRAINT FK_KhuyenMai_Marketing FOREIGN KEY (maNhanVienMarketing) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT CHK_ThoiGianKhuyenMai CHECK (ngayKetThuc >= ngayBatDau)
);

-- 8. BẢNG MÃ GIẢM GIÁ (COUPON)
CREATE TABLE MaGiamGia (
    maGiamGia VARCHAR(20) NOT NULL,
    maCode VARCHAR(50) NOT NULL UNIQUE,
    giaTriGiam DECIMAL(18, 2) NOT NULL,
    trangThai BIT DEFAULT 1,
    maKhuyenMai VARCHAR(20) NOT NULL,
    CONSTRAINT PK_MaGiamGia PRIMARY KEY (maGiamGia),
    CONSTRAINT FK_MaGiamGia_KhuyenMai FOREIGN KEY (maKhuyenMai) REFERENCES KhuyenMai(maKhuyenMai)
);

-- 9. BẢNG ĐĂNG KÝ KHÓA HỌC (Ghi danh)
CREATE TABLE DangKyKhoaHoc (
    maDangKy VARCHAR(20) NOT NULL,
    ngayDangKy DATETIME DEFAULT GETDATE(),
    trangThaiDK NVARCHAR(50) DEFAULT N'Đang học',
    maHocVien INT NOT NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_DangKyKhoaHoc PRIMARY KEY (maDangKy),
    CONSTRAINT FK_DangKy_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT FK_DangKy_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc),
    CONSTRAINT UQ_DangKy UNIQUE (maHocVien, maKhoaHoc)
);

-- 10. BẢNG TIẾN ĐỘ HỌC TẬP
CREATE TABLE TienDoHocTap (
    maTienDo VARCHAR(20) NOT NULL,
    phanTramHoanThanh FLOAT DEFAULT 0,
    lanTruyCapGanNhat DATETIME DEFAULT GETDATE(),
    maHocVien INT NOT NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_TienDoHocTap PRIMARY KEY (maTienDo),
    CONSTRAINT FK_TienDo_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT FK_TienDo_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc),
    CONSTRAINT CHK_PhanTram CHECK (phanTramHoanThanh BETWEEN 0 AND 100),
    CONSTRAINT UQ_TienDo UNIQUE (maHocVien, maKhoaHoc)
);

-- 11. BẢNG ĐÁNH GIÁ KHÓA HỌC (Đầu vào Lọc cộng tác)
CREATE TABLE DanhGiaKhoaHoc (
    maDanhGia VARCHAR(20) NOT NULL,
    soSao INT NOT NULL,
    noiDung NVARCHAR(MAX) NULL,
    ngayDanhGia DATETIME DEFAULT GETDATE(),
    maHocVien INT NOT NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_DanhGiaKhoaHoc PRIMARY KEY (maDanhGia),
    CONSTRAINT FK_DanhGia_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT FK_DanhGia_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc),
    CONSTRAINT CHK_SoSao CHECK (soSao BETWEEN 1 AND 5),
    CONSTRAINT UQ_DanhGia UNIQUE (maHocVien, maKhoaHoc)
);

-- 12. BẢNG KHÓA HỌC KHUYẾN NGHỊ (Đầu ra Lọc cộng tác)
CREATE TABLE KhoaHocKhuyenNghi (
    maGoiY VARCHAR(20) NOT NULL,
    diemDuDoan FLOAT NOT NULL,
    thuTuUuTien INT NOT NULL,
    ngayGoiY DATETIME DEFAULT GETDATE(),
    maHocVien INT NOT NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_KhoaHocKhuyenNghi PRIMARY KEY (maGoiY),
    CONSTRAINT FK_GoiY_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT FK_GoiY_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc)
);

-- 13. BẢNG ĐƠN HÀNG
CREATE TABLE DonHang (
    maDonHang VARCHAR(20) NOT NULL,
    ngayDat DATETIME DEFAULT GETDATE(),
    tongTien DECIMAL(18, 2) NOT NULL DEFAULT 0,
    trangThai NVARCHAR(50) DEFAULT N'Chờ thanh toán',
    maHocVien INT NOT NULL,
    maGiamGia VARCHAR(20) NULL,
    CONSTRAINT PK_DonHang PRIMARY KEY (maDonHang),
    CONSTRAINT FK_DonHang_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT FK_DonHang_MaGiamGia FOREIGN KEY (maGiamGia) REFERENCES MaGiamGia(maGiamGia)
);

-- 14. BẢNG CHI TIẾT ĐƠN HÀNG
CREATE TABLE ChiTietDonHang (
    maChiTiet VARCHAR(20) NOT NULL,
    donGia DECIMAL(18, 2) NOT NULL,
    maDonHang VARCHAR(20) NOT NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    CONSTRAINT PK_ChiTietDonHang PRIMARY KEY (maChiTiet),
    CONSTRAINT FK_CTDH_DonHang FOREIGN KEY (maDonHang) REFERENCES DonHang(maDonHang) ON DELETE CASCADE,
    CONSTRAINT FK_CTDH_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc)
);

-- 15. BẢNG THANH TOÁN
CREATE TABLE ThanhToan (
    maThanhToan VARCHAR(20) NOT NULL,
    soTien DECIMAL(18, 2) NOT NULL,
    phuongThuc NVARCHAR(50) NOT NULL, -- 'VNPay', 'MoMo'
    trangThaiThanhToan NVARCHAR(50) DEFAULT N'Chưa thanh toán',
    maDonHang VARCHAR(20) NOT NULL UNIQUE,
    CONSTRAINT PK_ThanhToan PRIMARY KEY (maThanhToan),
    CONSTRAINT FK_ThanhToan_DonHang FOREIGN KEY (maDonHang) REFERENCES DonHang(maDonHang)
);

-- 16. BẢNG NHẬN THANH TOÁN (Giáo viên rút tiền)
CREATE TABLE NhanThanhToan (
    maPhieuChi VARCHAR(20) NOT NULL,
    tiLeChietKhau FLOAT NOT NULL,
    soTienYeuCau DECIMAL(18, 2) NOT NULL,
    thucNhan DECIMAL(18, 2) NOT NULL,
    ngayYeuCau DATETIME DEFAULT GETDATE(),
    nganHang NVARCHAR(100) NOT NULL,
    trangThai NVARCHAR(50) DEFAULT N'Chờ xử lý',
    maGiaoVien INT NOT NULL,
    CONSTRAINT PK_NhanThanhToan PRIMARY KEY (maPhieuChi),
    CONSTRAINT FK_NhanThanhToan_GiaoVien FOREIGN KEY (maGiaoVien) REFERENCES NguoiDung(maNguoiDung),
    CONSTRAINT CHK_SoTienRut CHECK (soTienYeuCau > 0)
);

-- 17. BẢNG KIỂM DUYỆT KHÓA HỌC (Admin)
CREATE TABLE KiemDuyetKhoaHoc (
    maKiemDuyet VARCHAR(20) NOT NULL,
    ngayGui DATETIME DEFAULT GETDATE(),
    ngayKiemDuyet DATETIME NULL,
    trangThai NVARCHAR(50) DEFAULT N'Chờ duyệt',
    lyDoTuChoi NVARCHAR(MAX) NULL,
    maKhoaHoc VARCHAR(20) NOT NULL,
    maAdmin INT NULL,
    CONSTRAINT PK_KiemDuyetKhoaHoc PRIMARY KEY (maKiemDuyet),
    CONSTRAINT FK_KiemDuyet_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc),
    CONSTRAINT FK_KiemDuyet_Admin FOREIGN KEY (maAdmin) REFERENCES NguoiDung(maNguoiDung)
);

-- 18. BẢNG BÁO CÁO THỐNG KÊ
CREATE TABLE BaoCaoThongKe (
    maBaoCao VARCHAR(20) NOT NULL,
    loaiBaoCao NVARCHAR(50) NOT NULL,
    kyThongKe NVARCHAR(50) NOT NULL,
    tongDoanhThu DECIMAL(18, 2) DEFAULT 0,
    tongLuotDangKy INT DEFAULT 0,
    ngayLap DATETIME DEFAULT GETDATE(),
    maNguoiDung INT NOT NULL,
    CONSTRAINT PK_BaoCaoThongKe PRIMARY KEY (maBaoCao),
    CONSTRAINT FK_BaoCao_NguoiDung FOREIGN KEY (maNguoiDung) REFERENCES NguoiDung(maNguoiDung)
);



-- 1. Bổ sung các cột cho NguoiDung
ALTER TABLE NguoiDung ADD soDienThoai VARCHAR(10) NULL;
ALTER TABLE NguoiDung ADD gioiTinh NVARCHAR(10) NULL;
ALTER TABLE NguoiDung ADD anhDaiDien VARCHAR(500) NULL;

-- 2. Bổ sung các cột cho DanhMuc
ALTER TABLE DanhMuc ADD moTa NVARCHAR(500) NULL;
ALTER TABLE DanhMuc ADD trangThai BIT DEFAULT 1;

-- 3. Bổ sung các cột cho KhoaHoc
ALTER TABLE KhoaHoc ADD moTaNgan NVARCHAR(500) NULL;
ALTER TABLE KhoaHoc ADD mucTieuDauRa NVARCHAR(MAX) NULL;
ALTER TABLE KhoaHoc ADD anhBia VARCHAR(500) NULL;
ALTER TABLE KhoaHoc ADD capDo NVARCHAR(50) DEFAULT N'Mọi cấp độ';
ALTER TABLE KhoaHoc ADD giaKhuyenMai DECIMAL(18, 2) NULL;

-- 4. Bổ sung các cột cho BaiHoc
ALTER TABLE BaiHoc ADD duongDanVideo VARCHAR(500) NULL;
ALTER TABLE BaiHoc ADD choXemThu BIT DEFAULT 0;

-- 5. Bổ sung các cột cho NhanThanhToan
ALTER TABLE NhanThanhToan ADD soTaiKhoan VARCHAR(50) NOT NULL DEFAULT '';
ALTER TABLE NhanThanhToan ADD tenChuTaiKhoan NVARCHAR(100) NOT NULL DEFAULT '';

--Bổ sung 2 bảng
 CREATE TABLE KhuyenMaiKhoaHoc (
        maKhuyenMai VARCHAR(20) NOT NULL,
        maKhoaHoc VARCHAR(20) NOT NULL,
        CONSTRAINT PK_KhuyenMaiKhoaHoc PRIMARY KEY (maKhuyenMai, maKhoaHoc),
        CONSTRAINT FK_KMKH_KhuyenMai FOREIGN KEY (maKhuyenMai) REFERENCES KhuyenMai(maKhuyenMai) ON DELETE CASCADE,
        CONSTRAINT FK_KMKH_KhoaHoc FOREIGN KEY (maKhoaHoc) REFERENCES KhoaHoc(maKhoaHoc) ON DELETE CASCADE
);

CREATE TABLE TienDoBaiHoc (
        maTienDoBaiHoc INT IDENTITY(1,1) NOT NULL,
        thoiGianXemDungLai INT DEFAULT 0, -- Vị trí dừng video tính theo giây để khôi phục khi xem lại
        daHoanThanh BIT DEFAULT 0, -- 1 khi xem >= 80% thời lượng bài học (hiện tích xanh)
        ngayHoanThanh DATETIME NULL,
        lanTruyCapGanNhat DATETIME DEFAULT GETDATE(),
        maHocVien INT NOT NULL,
        maBaiHoc VARCHAR(20) NOT NULL,
        CONSTRAINT PK_TienDoBaiHoc PRIMARY KEY (maTienDoBaiHoc),
        CONSTRAINT FK_TienDoBH_HocVien FOREIGN KEY (maHocVien) REFERENCES NguoiDung(maNguoiDung),
        CONSTRAINT FK_TienDoBH_BaiHoc FOREIGN KEY (maBaiHoc) REFERENCES BaiHoc(maBaiHoc) ON DELETE CASCADE,
        CONSTRAINT UQ_TienDoBaiHoc UNIQUE (maHocVien, maBaiHoc)
    );





