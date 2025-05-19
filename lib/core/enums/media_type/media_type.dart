enum MediaTypeEnum {
  video('video'),
  image('image');

  const MediaTypeEnum(this.type);

  final String type;
}

extension ConvertMediaType on String {
  MediaTypeEnum toMediaTypeEnum() {
    switch (this) {
      case 'video':
        return MediaTypeEnum.video;
      case 'image':
        return MediaTypeEnum.image;
      default:
        throw MediaTypeEnum.image;
    }
  }
}