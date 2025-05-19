enum NotificationTypeEnum {
  message('message'),
  cancelled('Cancelled'),
  orderCreated('orderCreated'),
  orderOngoing('orderOngoing'),
  orderCompleted('orderCompleted'),
  advertExpire('advertExpire'),
  adminMessage('adminMessage');

  // confirmed('Confirmed'),
  // orderCreated('orderCreated'),
  // confirmed('Confirmed'),
  // preparing('Preparing'),
  // readyForPickUp('Ready For PickUp'),
  // cancelled('Cancelled'),
  // pickUpDone('PickUp Done'),
  // offer('offer'),
  // lowStock('lowStock'),
  // sellerRegistration('sellerRegistration'),
  // requestToEdit('requestToEdit'),
  // productListing('productListing');

  const NotificationTypeEnum(this.type);

  final String type;
}

// using an extension
// enhanced enums
extension ConvertNotificationTypeEnum on String {
  NotificationTypeEnum toNotificationTypeEnum() {
    switch (this) {
      case 'message':
        return NotificationTypeEnum.message;
      case 'Cancelled':
        return NotificationTypeEnum.cancelled;
      case 'adminMessage':
        return NotificationTypeEnum.adminMessage;
      case 'orderCreated':
        return NotificationTypeEnum.orderCreated;
      case 'orderOngoing':
        return NotificationTypeEnum.orderOngoing;
      case 'orderCompleted':
        return NotificationTypeEnum.orderCompleted;
      case 'advertExpire':
        return NotificationTypeEnum.advertExpire;
      // case 'preparing':
      //   return NotificationTypeEnum.preparing;
      // case 'Ready For PickUp':
      //   return NotificationTypeEnum.readyForPickUp;
      // case 'PickUp Done':
      //   return NotificationTypeEnum.pickUpDone;
      // case 'Cancelled':
      //   return NotificationTypeEnum.cancelled;
      // case 'offer':
      //   return NotificationTypeEnum.offer;
      // case 'lowStock':
      //   return NotificationTypeEnum.lowStock;
      // case 'sellerRegistration':
      //   return NotificationTypeEnum.sellerRegistration;
      // case 'productListing':
      //   return NotificationTypeEnum.productListing;
      // case 'requestToEdit':
      //   return NotificationTypeEnum.requestToEdit;
      default:
        return NotificationTypeEnum.message;
    }
  }
}
