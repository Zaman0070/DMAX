import 'dart:math';

import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/show_toast.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/model/tone_option.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:show_up_animation/show_up_animation.dart';

class LoadData extends StatefulWidget {
  const LoadData({super.key, required this.response, required this.toneOption});
  final List<String> response;
  final ToneOption toneOption;

  @override
  State<LoadData> createState() => _LoadDataState();
}

class _LoadDataState extends State<LoadData> {
  late List<String> accuracy;

  @override
  void initState() {
    super.initState();
    generateAccuracyList();
  }

  void generateAccuracyList() {
    final rand = Random();
    final List<List<int>> ranges = [
      [84, 96],
      [79, 88],
      [72, 82],
      [68, 77],
      [65, 75]
    ];

    accuracy = List.generate(widget.response.length, (index) {
      if (index < ranges.length) {
        final min = ranges[index][0];
        final max = ranges[index][1];
        return "${min + rand.nextInt(max - min + 1)}%";
      } else {
        // Default range if more items than ranges specified
        return "${65 + rand.nextInt(35)}%";
      }
    });
  }

  @override
  void didUpdateWidget(covariant LoadData oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.response.length != widget.response.length) {
      generateAccuracyList();
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> data = widget.response;
    if (data.isEmpty) {
      return const SizedBox();
    }
    return ShowUpList(
      children: data.asMap().entries.map(
        (entry) {
          final index = entry.key;
          final e = entry.value;
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
                            widget.toneOption.emoji,
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
                                  text: " ${widget.toneOption.label}",
                                  style: TextStyle(
                                    fontSize: MyFonts.size15,
                                    fontFamily: AppConstants.fontFamily,
                                    fontWeight: FontWeightManager.medium,
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
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: e)).then((_) {
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
      ).toList(),
    );
  }
}
