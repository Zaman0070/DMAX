import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/commons/common_widgets/dotted_animation.dart';
import 'package:dmax_app/commons/common_widgets/load_data.dart';
import 'package:dmax_app/features/chat/widgets/messages.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key});

  @override
  ConsumerState<ChatScreen> createState() => _DmaxScreenState();
}

class _DmaxScreenState extends ConsumerState<ChatScreen> {
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
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          padding18,
                          Container(
                            height: 36.h,
                            width: 361.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color(0xff1E1E1E).withOpacity(0.2),
                                  width: 0.5),
                              borderRadius: BorderRadius.circular(12.r),
                              color: context.whiteColor,
                            ),
                            child: TextField(
                              controller: TextEditingController(),
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: AppConstants.fontFamily,
                                fontWeight: FontWeightManager.medium,
                                color: context.secondary.withOpacity(0.8),
                              ),
                              decoration: InputDecoration(
                                hintText:
                                    "Veuillez entrer au moins un message pour obtenir des réponses.",
                                hintStyle: TextStyle(
                                  fontSize: 12.sp,
                                  fontFamily: AppConstants.fontFamily,
                                  fontWeight: FontWeightManager.medium,
                                  color: context.secondary.withOpacity(0.8),
                                ),
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.only(bottom: 17.h, left: 10.w),
                              ),
                            ),
                          ),
                          padding12,
                          if (isGenerating) const Messages(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 42.h,
                                width: 172.w,
                                decoration: BoxDecoration(
                                  color: context.whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          context.blackColor.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Sa réponse",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeightManager.bold,
                                      color: context.secondary.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: 42.h,
                                width: 172.w,
                                decoration: BoxDecoration(
                                  color: context.whiteColor,
                                  borderRadius: BorderRadius.circular(8.r),
                                  boxShadow: [
                                    BoxShadow(
                                      color:
                                          context.blackColor.withOpacity(0.1),
                                      blurRadius: 10,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Center(
                                  child: Text(
                                    "Sa réponse",
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontFamily: AppConstants.fontFamily,
                                      fontWeight: FontWeightManager.bold,
                                      color: context.secondary.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          padding12,
                          if (!isGenerating) SizedBox(height: 150.h),
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
                                  borderColor:
                                      context.secondary.withOpacity(0.6),
                                  hintText: "Dis moi ce que tu veux ...",
                                ),
                          padding12,
                          isGenerating
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                          !isLoadData
                              ? DottedAnimation(
                                  isGenerated: isGenerating,
                                )
                              : const LoadData(),
                        ],
                      ),
                    ),
                  ),
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
                child: SvgPicture.asset(
                  AppAssets.chatSvg,
                  width: 32.w,
                  height: 32.h,
                  colorFilter: ColorFilter.mode(
                    context.whiteColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    isGenerating = true;
                  });
                  Future.delayed(const Duration(seconds: 10), () {
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
                  AppAssets.love,
                  width: 33.w,
                  height: 33.h,
                ),
              ),
            ],
          ),
        ));
  }
}
