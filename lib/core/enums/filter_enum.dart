enum FilterEnum {
  day('day'),
  diet('diet'),
  category('category');

  const FilterEnum(this.type);
  final String type;
}

// using an extension
// enhanced enums
extension FilterType on String {
  FilterEnum toAccountTypeEnum() {
    switch (this) {
      case 'gender':
        return FilterEnum.day;
      case 'diet':
        return FilterEnum.diet;
      case 'location':
        return FilterEnum.category;
      default:
        return FilterEnum.day;
    }
  }
}