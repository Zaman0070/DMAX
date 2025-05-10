

import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.secondaryColor,
      appBar: AppBar(
        backgroundColor: MyColors.secondaryColor,
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
          "Privacy Policy",
          style: getSemiBoldStyle(
              color: context.blackColor, fontSize: MyFonts.size18),
        ),
      ),
    );
  }
}
