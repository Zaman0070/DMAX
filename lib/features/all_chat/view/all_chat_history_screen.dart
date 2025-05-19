import 'package:dmax_app/commons/common_functions/formated_date.dart';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/chat/controller/gemini_controller.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/routes/route_manager.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:dmax_app/utils/utils.dart';
import 'package:flutter_svg/svg.dart';

class AllChatHistoryScreen extends ConsumerStatefulWidget {
  const AllChatHistoryScreen({super.key});

  @override
  ConsumerState<AllChatHistoryScreen> createState() =>
      _AllChatHistoryScreenState();
}

class _AllChatHistoryScreenState extends ConsumerState<AllChatHistoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(sharePrefProvider).loadChatHistoryList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ctr = ref.watch(sharePrefProvider);
    if (ctr.isLoading) {
      return const Loading();
    }

    // Sort chat list by time ascending
    final chatList = List.from(ctr.chatHistoryModelList)
      ..sort((a, b) =>
          DateTime.parse(b.time ?? "").compareTo(DateTime.parse(a.time ?? "")));

    return Scaffold(
      body: BackgroundBody(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                padding24,
                const DMAXAppBar(isback: false),
                padding12,
                Text(
                  "Historique des conversations",
                  style: TextStyle(
                    fontSize: MyFonts.size16,
                    fontWeight: FontWeight.w600,
                    color: context.secondary,
                    fontFamily: AppConstants.fontFamily,
                  ),
                ),
                padding4,
                Text(
                  "Vous pouvez retrouver toutes vos conversations ici.",
                  style: TextStyle(
                    fontSize: MyFonts.size12,
                    fontWeight: FontWeight.w300,
                    color: context.secondary,
                    fontFamily: AppConstants.fontFamily,
                  ),
                ),
                padding24,
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: context.whiteColor,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: chatList.length,
                      padding: EdgeInsets.only(top: 12.h),
                      itemBuilder: (context, index) {
                        final data = chatList[index];
                        final dateTime = DateTime.parse(data.time ?? "");

                        return InkWell(
                          overlayColor: MaterialStateProperty.all(
                              MyColors.transparentColor),
                          onTap: () {
                            //   ref.watch(geminiApiProvider).chatHistory.clear();
                            //   data.imageUrl != null
                            //       ? ref
                            //           .watch(geminiApiProvider)
                            //           .sendTextWithImage(data.message ?? "",
                            //               data.imageUrl, 3, data.tone ?? "")
                            //       : ref.watch(geminiApiProvider)
                            //        .sendTextMessage(
                            //   data.text,
                            //   3,
                            //   ToneOption(
                            //       label: data.tone,
                            //       definition: selectedToneDefination,
                            //       example: selectedToneIcon,
                            //       emoji: selectedToneIcon),
                            //   ref
                            //       .watch(sharePrefProvider)
                            //       .chatHistoryModelList
                            //       .map((e) => e.message!)
                            //       .toList(),
                            // )
                            // sendTextMessage(
                            //     data.message ?? "", 3, data.tone ?? "");
                            Navigator.pushNamed(
                                context,
                                data.imageUrl != null
                                    ? AppRoutes.dmaxScreen
                                    : AppRoutes.chatScreen,
                                arguments: {
                                  "isLoadData": true,
                                });
                            setState(() {
                              ref.read(geminiApiProvider).isLoading = true;
                            });
                          },
                          child: Container(
                            height: 60.h,
                            width: 361.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              // color: context.whiteColor,
                              // boxShadow: [
                              //   BoxShadow(
                              //     color: context.secondary.withOpacity(0.1),
                              //     blurRadius: 10,
                              //     offset: const Offset(0, 1),
                              //   ),
                              // ],
                            ),
                            margin: EdgeInsets.only(bottom: 10.h),
                            padding: EdgeInsets.symmetric(horizontal: 12.w),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          AppAssets.clock,
                                          width: 30.h,
                                          height: 30.h,
                                        ),
                                        padding12,
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 250.w,
                                                minWidth: 100.w,
                                                minHeight: 20.h,
                                              ),
                                              child: Text(
                                                data.message ?? "",
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                  fontSize: MyFonts.size16,
                                                  fontFamily:
                                                      AppConstants.fontFamily,
                                                  fontWeight:
                                                      FontWeightManager.medium,
                                                  color: context.secondary,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              formatDuration(dateTime),
                                              style: TextStyle(
                                                fontSize: MyFonts.size10,
                                                fontFamily:
                                                    AppConstants.fontFamily,
                                                fontWeight:
                                                    FontWeightManager.light,
                                                color: context.secondary
                                                    .withOpacity(0.5),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SvgPicture.asset(
                                      AppAssets.arrowcircleSvg,
                                      height: 26.h,
                                      width: 26.w,
                                      fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(
                                          context.secondary, BlendMode.srcIn),
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: context.secondary.withOpacity(0.05),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
