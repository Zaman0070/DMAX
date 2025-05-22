import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/features/splash/danger/danger_screen.dart';
import 'package:dmax_app/features/splash/info/personal_info_screen.dart';
import 'package:dmax_app/features/splash/splash_screen.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:dmax_app/utils/loading.dart';
import 'package:dmax_app/utils/thems/theme.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Future.delayed(const Duration(seconds: 3), () {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    getUserInfo();
  }

  getUserInfo() async {
    final sharePrefController = ref.read(sharePrefProvider);
    await sharePrefController.getProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    final sharePrefState = ref.watch(sharePrefProvider);

    if (sharePrefState.isLoading) {
      return ScreenUtilInit(
        designSize: Size(AppConstants.screenWidget, AppConstants.screenHeight),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            theme: lightThemeData(context),
            debugShowCheckedModeBanner: false,
            home: Scaffold(
                body: Center(child: LoadingWidget(color: context.primary))),
          );
        },
      );
    }

    return ScreenUtilInit(
      designSize: Size(AppConstants.screenWidget, AppConstants.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (BuildContext context, Widget? child) {
            final MediaQueryData data = MediaQuery.of(context);
            //Text is generally big on IOS ro that why we set text scale factor for IOS to 0.9
            return MediaQuery(
              data: data.copyWith(
                  textScaleFactor:
                      Theme.of(context).platform == TargetPlatform.iOS
                          ? 0.9
                          : 1),
              child: child!,
            );
          },
          debugShowCheckedModeBanner: false,
          title: 'DMAX',
          theme: lightThemeData(context),
          onGenerateRoute: AppRoutes.onGenerateRoute,
          home: ref.read(sharePrefProvider).userInfo.isNotEmpty
              ? const PersonalInfoScreen()
              : const SplashScreen(),
        );
      },
    );
  }
}
