import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/commons/common_widgets/text_animation.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:show_up_animation/show_up_animation.dart';
import '../../../commons/common_imports/common_libs.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundBody(
            child: Padding(
      padding: EdgeInsets.all(AppConstants.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          padding26,
          ShowUpList(
            direction: Direction.horizontal,
            animationDuration: const Duration(milliseconds: 500),
            delayBetween: const Duration(milliseconds: 1000),
            offset: -0.2,
            children: <Widget>[
              padding12,
              TextAnimation(
                fontSize: 20.sp,
                fontWeight: FontWeightManager.medium,
                text: "Envoyer un bon DM, c’est un art…",
              ),
              padding18,
              TextAnimation(
                fontSize: 32.sp,
                fontWeight: FontWeightManager.medium,
                text: "Trop de gens échouent avant même d’avoir commencé",
              ),
              padding48,
              TextAnimation(
                fontSize: 40.sp,
                fontWeight: FontWeightManager.bold,
                text: "Mais Toi…",
                isToi: true,
              ),
              padding18,
              TextAnimation(
                fontSize: 32.sp,
                fontWeight: FontWeightManager.medium,
                text: "…Ca ne T’arrivera Pas.",
              ),
              padding64,
              padding4,
              TextAnimation(
                fontSize: 40.sp,
                fontWeight: FontWeightManager.medium,
                text: "Pour Ca,\n"
                    "Apprenons A Te \nConnaître",
              ),
              padding100,
              CustomButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, AppRoutes.personalInfoScreen, (route) => false);
                },
                buttonText: 'Dis-Nous Qui Tu Es…',
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
