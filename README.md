# LAB F5 – DANH SÁCH VÀ LƯỚI TRONG FLUTTER

## 1. Thông tin sinh viên

- **Họ và tên:** Xuân Nghi
- **Mã số sinh viên:** 231A010740
- **Môn học:** Lập trình trên các thiết bị di động
- **Bài thực hành:** Lab F5 – Danh sách và lưới trong Flutter
- **Công nghệ:** Flutter, Dart
- **IDE:** Android Studio

## 2. Giới thiệu

Project được thực hiện nhằm tìm hiểu và áp dụng các widget hiển thị danh sách và dạng lưới trong Flutter. Ứng dụng mô phỏng danh sách sản phẩm với hình ảnh, tên sản phẩm, mô tả và giá tiền.

Thông qua bài thực hành, em làm quen với cách xây dựng giao diện, quản lý dữ liệu và cập nhật giao diện khi có thao tác từ người dùng.

## 3. Chức năng chính

- Hiển thị danh sách 6 sản phẩm.
- Sử dụng `ListView.builder` để hiển thị danh sách.
- Sử dụng `ListView.separated` để tạo danh sách có đường phân cách.
- Sử dụng `GridView.builder` để hiển thị sản phẩm dạng lưới.
- Chuyển đổi giữa giao diện Danh sách và Lưới.
- Thêm sản phẩm mới vào đầu danh sách.
- Vuốt sản phẩm sang trái để xóa.
- Hiển thị giao diện thông báo khi danh sách trống.
- Sử dụng hình ảnh sản phẩm từ thư mục assets.

## 4. Chức năng nâng cao NC3 – Hoàn tác khi xóa sản phẩm

Ứng dụng được bổ sung chức năng hoàn tác khi người dùng xóa sản phẩm.

- Khi vuốt sản phẩm sang trái, sản phẩm sẽ được xóa khỏi danh sách.
- Hiển thị thông báo SnackBar sau khi xóa.
- Có nút **HOÀN TÁC** để khôi phục sản phẩm vừa xóa.
- Sản phẩm được khôi phục về vị trí ban đầu trong danh sách.
- Nếu không chọn hoàn tác trong thời gian hiển thị thông báo, sản phẩm vẫn được xóa.

## 5. Công nghệ sử dụng

| Công nghệ | Mục đích |
|---|---|
| Flutter | Xây dựng ứng dụng |
| Dart | Ngôn ngữ lập trình |
| Android Studio | Môi trường phát triển |
| ListView.builder | Hiển thị danh sách |
| GridView.builder | Hiển thị dạng lưới |
| Dismissible | Hỗ trợ vuốt xóa |
| SnackBar | Hiển thị thông báo và hoàn tác |
| setState() | Cập nhật giao diện |
| Image.asset | Hiển thị hình ảnh |

## 6. Cấu trúc thư mục

```text
f5_danhsach/
├── android/
├── assets/
│   └── images/
├── ios/
├── lib/
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── pubspec.yaml
└── README.md
```

## 7. Hướng dẫn cài đặt và chạy ứng dụng

**Bước 1:** Clone repository về máy tính.

```bash
git clone https://github.com/bts30121995123-source/F5_231A010740.git
```

**Bước 2:** Mở project bằng Android Studio.

**Bước 3:** Tải các thư viện cần thiết.

```bash
flutter pub get
```

**Bước 4:** Khởi động máy ảo Android hoặc kết nối thiết bị Android.

**Bước 5:** Chạy ứng dụng.

```bash
flutter run
```

## 8. Repository GitHub

Link source code:  
https://github.com/bts30121995123-source/F5_231A010740

## 9. Kết luận

Qua bài thực hành Lab F5, em đã tìm hiểu cách sử dụng các widget ListView và GridView trong Flutter, đồng thời thực hành thêm, xóa và cập nhật dữ liệu trên giao diện.

Đặc biệt, chức năng NC3 giúp người dùng có thể khôi phục sản phẩm khi vô tình xóa nhầm. Qua đó, em hiểu rõ hơn về cách quản lý trạng thái và xử lý tương tác trong Flutter.
