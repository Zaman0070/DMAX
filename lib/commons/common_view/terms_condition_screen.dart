import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

import '../../utils/constants/app_constants.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: context.scaffoldBackgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Image.asset(
            AppAssets.backArrowIcon,
            width: 20.w,
            height: 20.h,
            color: context.blackColor,
          ),
        ),
        title: Text(
          'Terms and Conditions',
          style: getSemiBoldStyle(
              color: context.blackColor, fontSize: MyFonts.size21),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding),
          child: Text(
            termAndCondition,
            style: getRegularStyle(color: context.blackColor, fontSize: MyFonts.size16),
          ),
        )
      ),
    );
  }
}

const String termAndCondition = '''
Terms of Use in Advertising and Selling on the NANOGA BW App
To use "NANOGA BW" for advertising and selling goods or services, users must adhere to advertising standards and restrictions to avoid account restrictions/ban. Please be aware that all numbers can be checked with the Botswana Police Service and Network Service Operators following the recent KYC registration for tracking down mobile phone users. Users can only be able to post and send messages or make orders provided that they have given this information of their phone number which is registered. So by agreeing to these terms and conditions you are consenting to this phone number being used for tracking you down to answer for any and all wrong-doing in the NANOGA BW App.

Advertisements violating the following are prohibited:

1. Illegal products/services and unlicensed supplements or medical products that are deemed unlawful by the Republic of Botswana.
2. Discriminatory content based on personal attributes.
3. Adult products and services related to sex industry are prohibited
4. Financial services without proper government licensing by the Republic of Botswana.
5. False products/services. Even if the products are lawful, information about them must also be true so as to avoid misleading the consumers/ customers as well.
This means the information must belong to the owner of the advertiser/seller or a written consent must be made by the owner giving authorisation to another person/entity to make the sale/advert.
6. Impersonating another person/entity/business as well as their products/services. It is prohibited to post/advertise/sell goods belonging to another when these are not belonging to the one/person posting them.
It can lead to serious charges of Fraud & Defamation of character and even imprisonment. Do not advertise under a name that is not your own or claim to sell goods/services which are not there, or put false prices, false descriptions or false location regarding said goods/services.

Advertisements breaching these rules may lead to restrictions or account bans.

Photos and Videos
The number of images that can be freely uploaded is a maximum number of 30 photos of the product or service being sold per business registered (where the number of businesses registered freely is Five Businesses). Ensure that the images are of high quality. Any photo size can be uploaded and the system will reduced the file size and image quality to normal size as per system capacity requirements. Any Naked photos will be rejected by the system. Do not upload photos containing: Sexual content, violence, real internal body organs and irrelevant images considering the advertisement subject.

Five, 1-Minute videos are allowed per business being advertised on the NANOGA BW App. The video must be relevant to the subject matter of the products/services being sold/advertised. Prohibited Videos are those involving but not limited to: Sexual scenes, violence, abuse, neglect, real internal body organs and/or engrossing content.

Terms of Use in Advertising and Buying on the NANOGA BW App.

The NANOGA BW App is a tool to be used for finding advertised goods/services but as a user you should be aware that:
1. Botswana's Marketplace App does not guarantee the quantity or quality of the goods! services you are buying. Botswana's Marketplace App is not responsible for how the bought goods will be transterred to the customer, or how the services are going to be provided.
2. NANOGA BW App encourages the use of the in-app chat platform to contact the owner or the advertisements before making the decision to buy/pay for any services or goods.
This also goes refers to doing due diligence and background checks on the seller on other social media platforms as well as reading the reviews of those who have previously bought said product/service or even contacting previous customer for confirmation.
3. NANOGA BW App advices like in any legal buying and selling situation, to make the purchases of goods/services in safe and secure locations as well making payments preferably in a way that can be tracked or have invoices/receipts if paid in cash. Basically a buyer should acquire proof/evidence of the sale or seller in case of any foul play.

Chatting on The NANOGA BW App Chats should be related to buying/selling of goods/services or tracking sales. The below messaging scenarios are prohibited and can lead to the user's account being deactivated or legal steps being taken against the offender: unrelated and personal message, spam messages and messages with illegal content.
''';