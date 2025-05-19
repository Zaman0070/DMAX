enum SaleTypeEnum {
  sale('sale'),
  rent('rent');
  // lease('lease');

  const SaleTypeEnum(this.type);

  final String type;
}

// Extension for SaleTypeEnum
extension ConvertSaleType on String {
  SaleTypeEnum toSaleTypeEnum() {
    switch (this) {
      case 'sale':
        return SaleTypeEnum.sale;
      case 'rent':
        return SaleTypeEnum.rent;
      // case 'lease':
      //   return SaleTypeEnum.lease;
      default:
        return SaleTypeEnum.sale;
    }
  }
}

extension ConvertSaleTypeToString on SaleTypeEnum {
  String toSaleTypeString() {
    switch (this) {
      case SaleTypeEnum.sale:
        return 'For Sale';
      case SaleTypeEnum.rent:
        return 'For Rent';
      default:
        return "For Sale";
    }
  }
}
