enum OrderStatusTypeEnum {
  dispatched('Dispatched'),
  ongoing('Ongoing'),
  completed('Completed'),
  cancelled('Cancelled');

  const OrderStatusTypeEnum(this.type);

  final String type;
}

// using an extension
// enhanced enums
extension ConvertOrderStatusType on String {
  OrderStatusTypeEnum toOrderStatusTypeEnum() {
    switch (this) {
      case 'Dispatched':
        return OrderStatusTypeEnum.dispatched;
      case 'Ongoing':
        return OrderStatusTypeEnum.ongoing;
      case 'Completed':
        return OrderStatusTypeEnum.completed;
      case 'Cancelled':
        return OrderStatusTypeEnum.cancelled;

      default:
        return OrderStatusTypeEnum.dispatched;
    }
  }
}
