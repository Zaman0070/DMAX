import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/dmax/widgets/add_screen_short.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/commons/common_widgets/dotted_animation.dart';
import 'package:dmax_app/commons/common_widgets/load_data.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DmaxScreen extends ConsumerStatefulWidget {
  const DmaxScreen({super.key});

  @override
  ConsumerState<DmaxScreen> createState() => _DmaxScreenState();
}

class _DmaxScreenState extends ConsumerState<DmaxScreen> {
  bool isGenerating = false;
  bool isLoadData = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BackgroundBody(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(AppConstants.padding - 7.5.w),
              child: Column(
                children: [
                  const DMAXAppBar(),
                  padding12,
                  AddScreenShort(
                    imgPath: (path) {},
                    isGenerating: isGenerating,
                  ),
                  padding12,
                  Row(
                    mainAxisAlignment: isGenerating
                        ? MainAxisAlignment.center
                        : MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(AppAssets.goalSvg,
                          width: 20.w, height: 20.h),
                      padding8,
                      Text('Objectif ou Contexte',
                          style: TextStyle(
                              fontSize: 16.sp,
                              fontFamily: AppConstants.fontFamily,
                              fontWeight: FontWeightManager.medium,
                              color: context.secondary)),
                    ],
                  ),
                  padding12,
                  isGenerating
                      ? Container(
                          height: 36.h,
                          width: 361.w,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: context.secondary.withOpacity(0.6),
                            ),
                            borderRadius: BorderRadius.circular(12.r),
                            color: context.whiteColor,
                          ),
                          child: Center(
                            child: Text(
                              "I want to invite her to my house",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeightManager.medium,
                                color: context.secondary,
                              ),
                            ),
                          ),
                        )
                      : CustomTextField(
                          verticalPadding: 0,
                          verticalMargin: 0,
                          texFieldHeight: 40.h,
                          controller: TextEditingController(),
                          borderColor: context.secondary,
                          hintText: "Dis moi ce que tu veux ...",
                        ),
                  padding12,
                  isGenerating
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1.h,
                              width: 80.w,
                              color: context.secondary.withOpacity(0.6),
                            ),
                            Text(
                              '    Masterclass à envoyer    ',
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeightManager.medium,
                                  color: context.secondary),
                            ),
                            Container(
                              height: 1.h,
                              width: 80.w,
                              color: context.secondary.withOpacity(0.6),
                            ),
                          ],
                        )
                      : Container(),
                  padding24,
                  !isLoadData
                      ? DottedAnimation(
                          isGenerated: isGenerating,
                        )
                      : const LoadData(),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          height: 90.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 29.r,
                backgroundColor: context.secondary,
                child: Image.asset(
                  AppAssets.codeIcon,
                  width: 32.w,
                  height: 32.h,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isGenerating = true;
                  });
                  Future.delayed(const Duration(seconds: 7), () {
                    setState(() {
                      isLoadData = true;
                    });
                  });
                },
                child: Container(
                  height: 58.h,
                  width: 232.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45.r),
                    color: context.secondary,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                          isLoadData ? AppAssets.reload : AppAssets.magicIcon,
                          width: 24.w,
                          height: 24.h),
                      padding16,
                      Text(
                        isLoadData ? "Régénérer" : 'Générer',
                        style: TextStyle(
                          fontFamily: AppConstants.fontFamily,
                          fontSize: MyFonts.size22,
                          color: context.whiteColor,
                          fontWeight: FontWeightManager.medium,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              CircleAvatar(
                radius: 29.r,
                backgroundColor: context.secondary,
                child: Image.asset(
                  AppAssets.shameIcon,
                  width: 44.w,
                  height: 44.h,
                ),
              ),
            ],
          ),
        ));
  }
}
