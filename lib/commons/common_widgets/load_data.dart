import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/show_toast.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:show_up_animation/show_up_animation.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key});

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  List<String> data = [
    "You look amazing! ",
    "Lorem ipsum sed at sed massa pharetra sed lacinia tortor pellentesque. Lorem ipsum sed at sed massa pharetra sed lacinia tortor pellentesque.",
    "Lorem ipsum sed at sed massa pharetra sed lacinia tortor pellentesque.",
  ];

  List<String> accuracy = [
    "88%",
    "79%",
    "68%",
  ];
  @override
  Widget build(BuildContext context) {
    return ShowUpList(
        children: data.map(
      (e) {
        int index = data.indexOf(e);
        return ShowUpAnimation(
          delayStart: const Duration(milliseconds: 100),
          animationDuration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          direction: Direction.horizontal,
          offset: 0.5,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 15),
            child: Stack(
              children: [
                Container(
                  width: 361.w,
                  margin: EdgeInsets.only(bottom: 10.h),
                  padding: EdgeInsets.only(
                      left: 22.w, top: 12.h, bottom: 30, right: 22.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    color: context.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: context.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    e,
                    style: TextStyle(
                      fontSize: MyFonts.size14,
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeightManager.regular,
                      color: context.secondary,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 20,
                  child: Container(
                    height: 26.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      color: MyColors.green,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          AppAssets.shameIcon,
                          width: 20.w,
                          height: 20.h,
                        ),
                        padding4,
                        Text.rich(
                          TextSpan(
                            text: accuracy[index],
                            style: TextStyle(
                              fontSize: MyFonts.size14,
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeightManager.bold,
                              color: context.whiteColor,
                            ),
                            children: [
                              TextSpan(
                                text: "  Flirty",
                                style: TextStyle(
                                  fontSize: MyFonts.size14,
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeightManager.regular,
                                  color: context.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 20,
                  child: InkWell(
                    // ignore: deprecated_member_use
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                    onTap: () {
                      Clipboard.setData(
                        ClipboardData(text: e),
                      ).then((_) {
                        showToast(msg: "Copié dans le presse-papier");
                      });
                    },
                    child: Container(
                      height: 26.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.r),
                        border: Border.all(
                          color: context.scaffoldBackgroundColor,
                          width: 1,
                        ),
                        color: MyColors.white,
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            AppAssets.copySvg,
                            width: 20.w,
                            height: 20.h,
                          ),
                          padding4,
                          Text('Copier',
                              style: TextStyle(
                                fontSize: MyFonts.size14,
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeightManager.regular,
                                color: context.secondary,
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    ).toList());
  }
}
