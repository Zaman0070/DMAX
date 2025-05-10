enum SellerServiceTypeEnum {
  service('service'),
  product('product');

  const SellerServiceTypeEnum(this.type);
  final String type;
}

// using an extension
// enhanced enums
extension ConvertSellerServiceType on String {
  SellerServiceTypeEnum toSellerServiceTypeEnum() {
    switch (this) {
      case 'service':
        return SellerServiceTypeEnum.service;
      case 'product':
        return SellerServiceTypeEnum.product;
      default:
        throw ArgumentError('Invalid SellerServiceTypeEnum value: $this');
    }
  }
}
