enum EditAddressEnum {
  home('Home'),
  office('Office'),
  ;

  const EditAddressEnum(this.type);
  final String type;
}

// using an extension
// enhanced enums
extension ConvertAccountType on String {
  EditAddressEnum toAccountTypeEnum() {
    switch (this) {
      case 'Home':
        return EditAddressEnum.home;
      case 'Office':
        return EditAddressEnum.office;

      default:
        return EditAddressEnum.home;
    }
  }
}
