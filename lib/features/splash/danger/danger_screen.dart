import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class DangerScreen extends StatelessWidget {
  const DangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppConstants.padding),
          child: Column(
            children: [
              padding24,
              Image.asset(
                AppAssets.socialImage,
                width: 340.w,
                height: 340.h,
              ),
              padding32,
              padding6,
              Text(
                'ATTENTION',
                style: TextStyle(
                  fontSize: MyFonts.size26,
                  fontWeight: FontWeightManager.semiBold,
                  color: const Color(0XFFF51C1C),
                  fontFamily: AppConstants.fontFamily,
                ),
              ),
              padding16,
              Text(
                  'Discuter avec plus de 5\npersonnes est considéré\ncomme du Charotisme',
                  textAlign: TextAlign.center,
                  style: getMediumStyle(
                      color: context.secondary, fontSize: MyFonts.size22)),
              padding26,
              Text(
                  'Tu risques de ne plus jamais envoyer un message sans réponse.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: context.secondary,
                      fontSize: MyFonts.size18,
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeightManager.medium)),
              const Spacer(),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.mainScreen, (route) => false);
                },
                buttonText: "Accepter Le Risque",
                backColor: MyColors.red,
                buttonHeight: 62.w,
                buttonWidth: 361.h,
                borderRadius: 12.r,
              ),
              padding18,
            ],
          ),
        ),
      ),
    );
  }
}
