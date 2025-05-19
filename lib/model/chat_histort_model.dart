class ChatHistortModel {
  String? id;
  String? message;
  String? time;
  String? imageUrl;
  String? tone;

  ChatHistortModel({
    this.id,
    this.message,
    this.time,
    this.imageUrl,
    this.tone,
  });

  ChatHistortModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    message = json['message'];
    time = json['time'];
    imageUrl = json['imageUrl'];
    tone = json['tone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['message'] = message;
    data['time'] = time;
    data['imageUrl'] = imageUrl;
    data['tone'] = tone;
    return data;
  }
}
