enum RentTypeEnum {
  hourly('hourly'),
  daily('daily'),
  monthly('monthly'),
  oneTime('oneTime');

  const RentTypeEnum(this.type);

  final String type;
}

// Extension for RentTypeEnum
extension ConvertRentType on String {
  RentTypeEnum toRentTypeEnum() {
    switch (this) {
      case 'hourly':
        return RentTypeEnum.hourly;
      case 'daily':
        return RentTypeEnum.daily;
      case 'monthly':
        return RentTypeEnum.monthly;
        case 'oneTime':
        return RentTypeEnum.oneTime;
      default:
        return RentTypeEnum.oneTime;
    }
  }
}

extension ConvertRentString on RentTypeEnum {
  String toRentTypeString() {
    switch (this) {
      case RentTypeEnum.hourly:
        return 'Per Hour';
      case RentTypeEnum.daily:
        return 'Per Day';
      case RentTypeEnum.monthly:
        return 'Per Month';
        case RentTypeEnum.oneTime:
        return "One Time";
      default:
        return "One Time";
    }
  }
}
