import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/main_menu/controller/main_menu_controller.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/svg.dart';

class DMAXAppBar extends StatelessWidget {
  const DMAXAppBar({super.key, this.isback = true});
  final bool isback;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isback
            ? SizedBox(
                width: 24.w,
                child: Consumer(builder: (context, ref, child) {
                  return InkWell(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      ref.watch(mainMenuProvider).setIndex(0);
                      // ref.watch(sharePrefProvider).clearChat();
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      AppAssets.arrowbackSvg,
                      width: 24.w,
                      height: 24.h,
                      colorFilter: ColorFilter.mode(
                        context.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  );
                }),
              )
            : Container(width: 24.w),
        Text.rich(
          TextSpan(
            text: "DM",
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeightManager.extraBold,
              color: context.primary,
              fontFamily: AppConstants.fontFamily,
            ),
            children: [
              TextSpan(
                text: "AX",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeightManager.extraBold,
                  color: context.blackColor,
                  fontFamily: AppConstants.fontFamily,
                ),
              ),
            ],
          ),
        ),
        Container(width: 24.w),
      ],
    );
  }
}
