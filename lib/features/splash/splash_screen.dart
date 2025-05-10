import 'dart:async';

import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_widgets/text_animation.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import '../../../commons/common_imports/common_libs.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushNamedAndRemoveUntil(
            context, AppRoutes.introScreen, (route) => false));
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(AppConstants.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          padding40,
          Center(
            child: Image.asset(
              AppAssets.logoPng,
              width: 99.w,
              height: 160.h,
            ),
          ),
          padding40,
          TextAnimation(
            fontSize: MyFonts.size40,
            fontWeight: FontWeightManager.bold,
            text: "DMAX",
            isDM: true,
          ),
        ],
      ),
    ));
  }
}
