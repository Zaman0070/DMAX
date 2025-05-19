import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/features/chat/view/chat_screen.dart';
import 'package:dmax_app/features/dmax/view/dmax_screen.dart';
import 'package:dmax_app/features/main_menu/views/main_menu_screen.dart';
import 'package:dmax_app/features/splash/danger/danger_screen.dart';
import 'package:dmax_app/features/splash/get_started_screen.dart';
import 'package:dmax_app/features/splash/info/personal_info_screen.dart';
import 'package:dmax_app/features/splash/intro_screen.dart';
import 'package:dmax_app/features/splash/splash_screen.dart';
import 'navigation.dart';

class AppRoutes {
  static const String splashScreen = '/splashScreen';
  static const String introScreen = '/introScreen';
  static const String getStartScreen = '/getStartScreen';
  static const String personalInfoScreen = '/signUpPhoneScreen';
  static const String dangerScreen = '/dangerScreen';
  static const String dmaxScreen = '/dmaxScreen';
  static const String chatScreen = '/chatScreen';
  static const String mainScreen = '/mainScreen';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return _buildRoute(const SplashScreen());
      case introScreen:
        return _buildRoute(const IntroScreen());
      case getStartScreen:
        return _buildRoute(const GetStartedScreen());
      case personalInfoScreen:
        return _buildRoute(const PersonalInfoScreen());
      case dangerScreen:
        return _buildRoute(const DangerScreen());
      case dmaxScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return _buildRoute( DmaxScreen(
          isLoadData: args['isLoadData'],
          isFromChat: args['isFromChat'],

        ));
      case chatScreen:
        final args = settings.arguments as Map<String, dynamic>;
        return _buildRoute(ChatScreen(
          isLoadData: args['isLoadData'],
        ));
      case mainScreen:
        return _buildRoute(const MainMenuScreen());

      // case signUpPhoneScreen:
      //   return _buildRoute(const SignUpPhoneScreen());
      // case otpScreen:

      //   return _buildRoute(OtpScreen(
      //     phone: args['phone'],
      //     verificationId: args['verificationId'],
      //     isLogin: args['isLogin'],
      //     fullName: args['fullName'],
      //     isLink: args['isLink'],
      //   ));

      default:
        return unDefinedRoute();
    }
  }

  static unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => const Scaffold(
              backgroundColor: Colors.white,
            ));
  }

  static _buildRoute(Widget widget, {int? duration = 400}) {
    return forwardRoute(widget, duration);
  }

  static _buildNormalRoute(Widget widget) {
    return MaterialPageRoute(builder: (_) => widget);
  }
}
