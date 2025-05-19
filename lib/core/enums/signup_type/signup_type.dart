enum SignupTypeEnum{
  google('google'),
  email('email'),
  apple('apple'),
  phone('phone');


  const SignupTypeEnum(this.type);
  final String type;
}

// using an extension
// enhanced enums
extension ConvertSignupTypeEnum on String{
  SignupTypeEnum toSignUpTypeEnum(){
    switch(this){
      case 'google':
        return SignupTypeEnum.google;
        case 'email':
        return SignupTypeEnum.email;
        case 'apple':
        return SignupTypeEnum.apple;
      case 'phone':
        return SignupTypeEnum.phone;
      default:
        return SignupTypeEnum.email;
    }
  }
}