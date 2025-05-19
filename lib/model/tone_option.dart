// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToneOption {
  final String label;
  final String definition;
  final String example;
  final String emoji;
  ToneOption({
    required this.label,
    required this.definition,
    required this.example,
    required this.emoji,
  });

  ToneOption copyWith({
    String? label,
    String? definition,
    String? example,
    String? emoji,
  }) {
    return ToneOption(
      label: label ?? this.label,
      definition: definition ?? this.definition,
      example: example ?? this.example,
      emoji: emoji ?? this.emoji,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'definition': definition,
      'example': example,
      'emoji': emoji,
    };
  }

  factory ToneOption.fromMap(Map<String, dynamic> map) {
    return ToneOption(
      label: map['label'] as String,
      definition: map['definition'] as String,
      example: map['example'] as String,
      emoji: map['emoji'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToneOption.fromJson(String source) => ToneOption.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ToneOption(label: $label, definition: $definition, example: $example, emoji: $emoji)';
  }

  @override
  bool operator ==(covariant ToneOption other) {
    if (identical(this, other)) return true;
  
    return 
      other.label == label &&
      other.definition == definition &&
      other.example == example &&
      other.emoji == emoji;
  }

  @override
  int get hashCode {
    return label.hashCode ^
      definition.hashCode ^
      example.hashCode ^
      emoji.hashCode;
  }
}
