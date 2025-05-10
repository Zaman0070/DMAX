import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class ScreenShorView extends StatelessWidget {
  const ScreenShorView(
      {super.key,
      this.isMAx = true,
      required this.title,
      required this.subTitle});
  final bool isMAx;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isMAx ? 336.h : 282.h,
      width: 361.w,
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: context.blackColor.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          padding12,
          Text(
            title,
            style: TextStyle(
                fontSize: 17.sp,
                fontWeight: FontWeight.w600,
                color: context.blackColor,
                fontFamily: AppConstants.fontFamily),
          ),
          Text(
            subTitle,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w300,
                color: const Color.fromRGBO(48, 52, 55, 1).withOpacity(0.6),
                fontFamily: AppConstants.fontFamily),
          ),
          padding8,
          isMAx
              ? Image.asset(
                  AppAssets.screenshortsImage,
                  height: 250.h,
                  width: 330.w,
                  fit: BoxFit.fitWidth,
                )
              : Image.asset(
                  AppAssets.screenshorts1Image,
                  height: 200.h,
                  width: 170.w,
                  fit: BoxFit.fitWidth,
                )
        ],
      ),
    );
  }
}
