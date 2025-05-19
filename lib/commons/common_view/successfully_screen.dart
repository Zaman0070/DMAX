import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class SuccessfullyScreen extends StatelessWidget {
  const SuccessfullyScreen(
      {super.key,
      required this.title,
      required this.message,
      required this.onButtonPressed,
      this.buttonText = 'Go Home'});
  final String title;
  final String message;
  final VoidCallback onButtonPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.primary,
      body: Padding(
        padding: EdgeInsets.all(AppConstants.padding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                // AppAssets.doneImage,
                "",
                height: 292.h,
                width: 292.w,
              ),
            ),
            padding24,
            Text(
              title,
              textAlign: TextAlign.center,
              style: getSemiBoldStyle(
                  color: context.whiteColor, fontSize: MyFonts.size34),
            ),
            padding12,
            Text(
              message,
              textAlign: TextAlign.center,
              style: getRegularStyle(
                  color: context.whiteColor.withOpacity(0.6),
                  fontSize: MyFonts.size17),
            ),
            padding32,
            CustomButton(
              onPressed: onButtonPressed,
              buttonText: buttonText ?? 'Go Home',
              buttonWidth: 155.w,
              buttonHeight: 60.h,
              borderRadius: 100.r,
              backColor: context.whiteColor,
              textColor: context.primary,
            )
          ],
        ),
      ),
    );
  }
}
