enum BannerLocationType {
  userHome('userHome'),
  userService('userService'),
  sellerService('sellerService'),
  userSubService('userSubService'),
  userFavourite('userFavourite'),
  userServiceSearch('userServiceSearch'),
  myAdverts('myAdverts'),
  adverts('categories');
  // defaultLocation('defaultLocation');

  const BannerLocationType(this.type);

  final String type;
}

// enhanced enums
extension ConvertBannerLocationType on String {
  BannerLocationType toBannerLocationTypeEnum() {
    switch (this) {
      case 'userHome':
        return BannerLocationType.userHome;
      case 'userService':
        return BannerLocationType.userService;
      case 'sellerService':
        return BannerLocationType.sellerService;
      case 'userSubService':
        return BannerLocationType.userSubService;
      case 'categories':
        return BannerLocationType.adverts;
      case 'userServiceSearch':
        return BannerLocationType.userServiceSearch;
      case 'userFavourite':
        return BannerLocationType.userFavourite;
      case 'myAdverts':
        return BannerLocationType.myAdverts;
      default:
        return BannerLocationType.userHome;
      // default:
      //   return BannerLocationType.defaultLocation;
    }
  }
}