import 'package:equatable/equatable.dart';

class RelationshipModel extends Equatable {
  final String value;
  final String text;

  const RelationshipModel({
    required this.value,
    required this.text,
  });

  factory RelationshipModel.fromJson(Map<String, dynamic> json) {
    return RelationshipModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
