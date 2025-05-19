enum AvailabilityEnum {
  yes('yes'),
  no('no');

  const AvailabilityEnum(this.type);
  final String type;
}

// using an extension
// enhanced enums

extension ConvertAvailability on String {
  AvailabilityEnum toAvailabilityEnum() {
    switch (this) {
      case 'yes':
        return AvailabilityEnum.yes;
      case 'no':
        return AvailabilityEnum.no;
      default:
        throw ArgumentError('Invalid AvailabilityEnum value: $this');
    }
  }
}
// extension ConvertSellerServiceType on String {
//   AvailabilityEnum toSellerServiceTypeEnum() {
//     switch (this) {
//       case 'yes':
//         return AvailabilityEnum.yes;
//       case 'no':
//         return SellerChooseLocationEnum.no;
//       default:
//         throw ArgumentError('Invalid SellerServiceTypeEnum value: $this');
//     }
//   }

