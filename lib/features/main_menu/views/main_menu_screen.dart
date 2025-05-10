import 'dart:io';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/main_menu/controller/main_menu_controller.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:flutter_svg/svg.dart';

class MainMenuScreen extends ConsumerStatefulWidget {
  const MainMenuScreen({super.key});

  @override
  ConsumerState<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends ConsumerState<MainMenuScreen> {
  @override
  Widget build(BuildContext context) {
    final mainMenuCtr = ref.watch(mainMenuProvider);
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.all(6.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: context.scaffoldBackgroundColor,
        ),
        child: Container(
          height: 80.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: context.whiteColor,
            shape: BoxShape.circle,
          ),
          child: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              Navigator.pushNamed(context, AppRoutes.dmaxScreen);
            },
            child: Image.asset(
              AppAssets.logoPng,
              height: 48.h,
              width: 30.w,
            ),
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: context.whiteColor, boxShadow: [
          BoxShadow(
            color: context.primary.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 10,
            offset: const Offset(0, -1), // changes position of shadow
          ),
        ]),
        height: Platform.isIOS ? 90.h : 80.h,
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: context.secondary,
          currentIndex: mainMenuCtr.index,
          selectedLabelStyle:
              getBoldStyle(color: context.secondary, fontSize: MyFonts.size10),
          showUnselectedLabels: true,
          unselectedItemColor: context.bodyTextColor.withOpacity(0.7),
          unselectedLabelStyle: TextStyle(
            color: context.errorColor,
            fontSize: MyFonts.size10,
            fontFamily: AppConstants.fontFamily,
            fontWeight: FontWeight.w600,
          ),
          items: [
            navigationItem(
                icon: AppAssets.chatSvg,
                activeIcon: AppAssets.chatSvg,
                label: 'Nouveau'),
            const BottomNavigationBarItem(
              icon: SizedBox(),
              label: '',
            ),
            navigationItem(
                icon: AppAssets.chatAddSvg,
                activeIcon: AppAssets.chatAddSvg,
                label: 'Discussions'),
          ],
          backgroundColor: context.whiteColor,
          elevation: 10,
          onTap: (index) {
            mainMenuCtr.setIndex(index);
            mainMenuCtr.pageController.jumpToPage(index);
            // pageController.jumpToPage(tabIndex);
          },
        ),
      ),
      body: PageView(
        controller: mainMenuCtr.pageController,
        onPageChanged: (v) {
          mainMenuCtr.setIndex(v);
        },
        children: [mainMenuCtr.screens[mainMenuCtr.index]],
      ),
    );
  }

  navigationItem({
    required String icon,
    required String activeIcon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        icon,
        height: 32.h,
        width: 32.w,
        colorFilter: ColorFilter.mode(
            context.bodyTextColor.withOpacity(0.7), BlendMode.srcIn),
      ),
      activeIcon: SvgPicture.asset(
        activeIcon,
        height: 32.h,
        width: 32.w,
        colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
      ),
      label: label,
    );
  }
}
