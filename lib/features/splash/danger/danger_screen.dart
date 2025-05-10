import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/custom_button.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DangerScreen extends StatelessWidget {
  const DangerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 1.sh,
        width: 1.sw,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.alartImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.padding),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: SvgPicture.asset(
                          AppAssets.arrowbackSvg,
                          width: 24.w,
                          height: 24.h,
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    AppAssets.alertSvg,
                    width: 86.w,
                    height: 86.h,
                  ),
                  padding100,
                  padding64,
                  Stack(
                    children: [
                      Text(
                        'DANGER TANA',
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeight.w400,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = MyColors.red),
                      ),
                      Text(
                        'DANGER TANA',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                          color: const Color(0XFFF5B71C),
                          fontFamily: AppConstants.fontFamily,
                        ),
                      ),
                    ],
                  ),
                  padding18,
                  Text(
                      'Attention : Draguer plus de 6 personnes en même temps est officiellement considéré comme du Tana.',
                      textAlign: TextAlign.center,
                      style: getMediumStyle(
                          color: context.whiteColor, fontSize: MyFonts.size22)),
                  padding18,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: Image.asset(AppAssets.info,
                            width: 18.w, height: 18.h),
                      ),
                      padding2,
                      Expanded(
                        child: Text(
                            'Tu risques de ne plus jamais envoyer un message sans réponse.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: context.whiteColor,
                                fontSize: 18,
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeight.w400)),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutes.mainScreen, (route) => false);
                    },
                    buttonText: "Accepter le risque 🔥",
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
        ));
  }
}
