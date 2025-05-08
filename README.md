# easy_base

Flutter project mẫu base chung cho các dự án mới của SDS

## Getting Started

### Cấu trúc thư mục
- Cấu trúc chia theo dạng các modules
- Thư mục core chứa thông tin base, enum, router, values sử dụng trong toàn bộ dự án
- Thư mục shares chứa các function, model, package, widget... dùng chung
- Mỗi thư mục sẽ có `tên thư mục`.src.dart để export các file trong thư mục đó
- Thư mục package sẽ chứa file `export_package.dart` export các package sử dụng trong dự án để tránh xung đột khi sử dụng và hạn chế import trong các file code

### Generated

- Dữ liệu ảnh sẽ để trong thư mục assets/image và gen code theo hướng dẫn trong file `README image.md` để cập nhật nhanh code khi thay đổi dữ liệu ảnh
- Dữ liệu ngôn ngữ sẽ để trong thư mục assets/locales và gen code theo hướng dẫn trong file `README locales.md` để có thể sử dụng đa ngôn ngữ.
