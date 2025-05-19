class MessageModel {
  final String message;
  final String type;

  MessageModel({
    required this.message,
    required this.type,
  });

  @override
  String toString() {
    return 'MessageModel{message: $message, type: $type}';
  }
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'type': type,
    };
  }
  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'] as String,
      type: json['type'] as String,
    );
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MessageModel &&
        other.message == message &&
        other.type == type;
  }
  @override
  int get hashCode => message.hashCode ^ type.hashCode;
}