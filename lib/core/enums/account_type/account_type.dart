enum AccountTypeEnum {
  user('user'),
  seller('seller'),
  admin('admin');

  const AccountTypeEnum(this.type);

  final String type;
}

// using an extension
// enhanced enums
extension ConvertAccountType on String {
  AccountTypeEnum toAccountTypeEnum() {
    switch (this) {
      case 'user':
        return AccountTypeEnum.user;
      case 'seller':
        return AccountTypeEnum.seller;
      case 'admin':
        return AccountTypeEnum.admin;

      default:
        return AccountTypeEnum.user;
    }
  }
}
