import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/features/home/widgets/screen_shor_view.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _DmaxScreenState();
}

class _DmaxScreenState extends ConsumerState<HomeScreen> {
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
    return Scaffold(
      body: BackgroundBody(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(AppConstants.padding),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const DMAXAppBar(isback: false),
                  padding12,
                  InkWell(
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.dmaxScreen,
                          arguments: {
                            "isLoadData": false,
                            "isFromChat": false,
                          });
                    },
                    child: const ScreenShorView(
                      isMAx: true,
                      title: 'Téléverse une capture d’écran',
                      subTitle: 'Story ou Discussion',
                    ),
                  ),
                  padding16,
                  InkWell(
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.dmaxScreen,
                          arguments: {
                            "isLoadData": false,
                            "isFromChat": true,
                          });
                    },
                    child: const ScreenShorView(
                      isMAx: false,
                      title: 'Écrire le message',
                      subTitle: 'à la main',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
