enum EventStatusEnum {
  pending('pending'),
  active('active'),
  rejected('rejected');

  const EventStatusEnum(this.type);

  final String type;
}

// enhanced enums
extension ConvertEventStatus on String {
  EventStatusEnum toEventStatusEnum() {
    switch (this) {
      case 'pending':
        return EventStatusEnum.pending;
      case 'active':
        return EventStatusEnum.active;
      case 'rejected':
        return EventStatusEnum.rejected;
      default:
        return EventStatusEnum.pending;
    }
  }
}
