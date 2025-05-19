enum SubscriptionTypeEnum {
  free('free'),
  monthly('monthly'),
  yearly('yearly');

  const SubscriptionTypeEnum(this.type);

  final String type;
}

extension ConvertSubscriptionType on String {
  SubscriptionTypeEnum toSubscriptionTypeEnum() {
    switch (this) {
      case 'free':
        return SubscriptionTypeEnum.free;
      case 'monthly':
        return SubscriptionTypeEnum.monthly;
      case 'yearly':
        return SubscriptionTypeEnum.yearly;
      default:
        return SubscriptionTypeEnum.free;
    }
  }
}
