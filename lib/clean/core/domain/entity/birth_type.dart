import 'package:equatable/equatable.dart';

/// Chỉ có năm sinh - Dùng cho tờ khai TK1 của thủ tục 607
class BirthType extends Equatable {
  final String value;
  final String text;

  const BirthType({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];
}
