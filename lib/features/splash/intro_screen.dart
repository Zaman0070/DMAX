import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/commons/common_widgets/text_animation.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../commons/common_imports/common_libs.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundBody(
            child: Padding(
      padding: EdgeInsets.all(AppConstants.padding-2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          padding26,
          ShowUpList(
            direction: Direction.horizontal,
            animationDuration: const Duration(milliseconds: 500),
            delayBetween: const Duration(milliseconds: 1000),
            offset: -0.2,
            children: <Widget>[
              padding12,
              Image.asset(
                AppAssets.logoPng,
                width: 99.w,
                height: 160.h,
              ),
              padding56,
              TextAnimation(
                fontSize: MyFonts.size40,
                fontWeight: FontWeightManager.bold,
                text: "Deviens\nImbattable En DM",
                isDM: true,
              ),
              padding18,
              TextAnimation(
                fontSize: MyFonts.size20,
                fontWeight: FontWeightManager.regular,
                text:
                    "Lance La Conversation Et Garde Le Jeu De\nSéduction À Chaque Instant",
              ),
              padding100,
              padding24,
              CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.getStartScreen, (route) => false);
                },
                buttonText: 'Commencer',
                backColor: context.secondary,
                buttonHeight: 58.h,
                buttonWidth: 361.w,
                borderRadius: 12.r,
                isShadow: true,
              ),
              padding56,
            ],
          ),
        ],
      ),
    )));
  }
}
