import 'dart:math';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/commons/common_widgets/show_bottom_sheet.dart';
import 'package:dmax_app/commons/common_widgets/show_toast.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/chat/controller/gemini_controller.dart';
import 'package:dmax_app/features/chat/widgets/tone_bottom_sheet.dart';
import 'package:dmax_app/features/dmax/widgets/add_screen_short.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/commons/common_widgets/dotted_animation.dart';
import 'package:dmax_app/commons/common_widgets/load_data.dart';
import 'package:dmax_app/features/dmax/widgets/chat_view_widget.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/model/chat_histort_model.dart';
import 'package:dmax_app/model/tone_option.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

// class DmaxScreen extends ConsumerStatefulWidget {
//   const DmaxScreen({
//     super.key,
//     required this.isLoadData,
//     required this.isFromChat,
//   });

//   final bool isLoadData;
//   final bool isFromChat;

//   @override
//   ConsumerState<DmaxScreen> createState() => _DmaxScreenState();
// }

// class _DmaxScreenState extends ConsumerState<DmaxScreen> {
//   bool isGenerating = false;
//   bool isLoadData = false;
//   String? imagePath;
//   String? base64Image;

//   int messageCount = 2;

//   late TextEditingController chatCtr;
//   final FocusNode chatFocus = FocusNode();

//   final FocusNode saReponseFocus = FocusNode();
//   final FocusNode maReponseFocus = FocusNode();

//   final TextEditingController myMessageCtr = TextEditingController();
//   final TextEditingController otherMessageCtr = TextEditingController();

//   bool isSaFocused = false;
//   bool isMaFocused = false;
//   bool isChatFocused = false;

//   @override
//   void initState() {
//     super.initState();

//     chatCtr = TextEditingController();

//     chatFocus.addListener(() {
//       setState(() {
//         isChatFocused = chatFocus.hasFocus;
//       });
//     });

//     saReponseFocus.addListener(() {
//       setState(() {
//         isSaFocused = saReponseFocus.hasFocus;
//         isChatFocused = false;
//       });
//     });

//     maReponseFocus.addListener(() {
//       setState(() {
//         isMaFocused = maReponseFocus.hasFocus;
//         isChatFocused = false;
//       });
//     });
//     isLoadData = widget.isLoadData;
//     getUserInfo();
//     isChatView = widget.isFromChat;
//   }

//   @override
//   void dispose() {
//     chatCtr.dispose();
//     myMessageCtr.dispose();
//     otherMessageCtr.dispose();
//     saReponseFocus.dispose();
//     maReponseFocus.dispose();
//     super.dispose();
//   }

//   getUserInfo() async {
//     final sharePrefController = ref.read(sharePrefProvider);
//     await sharePrefController.getProfileInfo();
//   }

//   String selectedTone = "Désinvolte";
//   String selectedToneIcon = AppAssets.HeartOnFire;
//   String selectedToneDefination =
//       "Détaché, cool, presque indifférent… mais avec une touche de charme naturel. C’est le ton de quelqu’un qui n’a rien à prouver, qui reste toujours au-dessus de la mêlée.";
//   String toneExample = "Je te laisse croire que t’as l’avantage, c’est mignon.";

//   bool isChatView = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: BackgroundBody(
//           child: SafeArea(
//             child: Padding(
//               padding: EdgeInsets.all(AppConstants.padding - 7.5.w),
//               child: Column(
//                 children: [
//                   const DMAXAppBar(),
//                   Expanded(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           padding8,
//                           isChatView
//                               ? ChatViewWidget(
//                                   myMessageCtr: myMessageCtr,
//                                   saReponseFocus: saReponseFocus,
//                                   maReponseFocus: maReponseFocus,
//                                   isSaFocused: isSaFocused,
//                                   isMaFocused: isMaFocused,
//                                 )
//                               : AddScreenShort(
//                                   onBase64Ready: (String encoded) {
//                                     setState(() {
//                                       base64Image = encoded;
//                                     });
//                                   },
//                                   isGenerating: isGenerating,
//                                 ),
//                           padding6,
//                           Row(
//                             mainAxisAlignment: isLoadData
//                                 ? MainAxisAlignment.center
//                                 : MainAxisAlignment.start,
//                             children: [
//                               SvgPicture.asset(AppAssets.goalSvg,
//                                   width: 20.w, height: 20.h),
//                               padding8,
//                               Text(
//                                   isLoadData
//                                       ? "Conversation Goal"
//                                       : 'Contexte et Objectif',
//                                   style: TextStyle(
//                                       fontSize: 16.sp,
//                                       fontFamily: AppConstants.fontFamily,
//                                       fontWeight: FontWeightManager.medium,
//                                       color: context.secondary)),
//                             ],
//                           ),
//                           padding8,
//                           isLoadData
//                               ? Container(
//                                   width: 361.w,
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 10.h, horizontal: 15.w),
//                                   decoration: BoxDecoration(
//                                     border: Border.all(
//                                       color: context.secondary.withOpacity(0.6),
//                                     ),
//                                     borderRadius: BorderRadius.circular(12.r),
//                                     color: context.whiteColor,
//                                   ),
//                                   child: Center(
//                                     child: Text(
//                                       chatCtr.text,
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(
//                                         fontSize: 14.sp,
//                                         fontFamily: AppConstants.fontFamily,
//                                         fontWeight: FontWeightManager.medium,
//                                         color: context.secondary,
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                               : CustomTextField(
//                                   focusNode: chatFocus,
//                                   verticalPadding: 10,
//                                   verticalMargin: 0,
//                                   texFieldHeight: 40.h,
//                                   controller: chatCtr,
//                                   borderColor: context.secondary,
//                                   hintText: "Dis moi ce que tu veux ...",
//                                   maxLines: 5,
//                                 ),
//                           padding12,
//                           isLoadData
//                               ? Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Container(
//                                       height: 1.h,
//                                       width: 80.w,
//                                       color: context.secondary.withOpacity(0.6),
//                                     ),
//                                     Text(
//                                       '    Masterclass à envoyer    ',
//                                       style: TextStyle(
//                                           fontSize: 14.sp,
//                                           fontFamily: AppConstants.fontFamily,
//                                           fontWeight: FontWeightManager.medium,
//                                           color: context.secondary),
//                                     ),
//                                     Container(
//                                       height: 1.h,
//                                       width: 80.w,
//                                       color: context.secondary.withOpacity(0.6),
//                                     ),
//                                   ],
//                                 )
//                               : Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     SvgPicture.asset(
//                                       AppAssets.growSvg,
//                                       width: 20.w,
//                                       height: 20.h,
//                                       fit: BoxFit.fill,
//                                     ),
//                                     padding8,
//                                     Text("Exploration des Possibilités",
//                                         style: TextStyle(
//                                             fontSize: 16.sp,
//                                             fontFamily: AppConstants.fontFamily,
//                                             fontWeight:
//                                                 FontWeightManager.medium,
//                                             color: context.secondary)),
//                                   ],
//                                 ),
//                           padding12,
//                           !isLoadData
//                               ? DottedAnimation(
//                                   isGenerated: isGenerating,
//                                 )
//                               : LoadData(
//                                   toneOption: ToneOption(
//                                       label: selectedTone,
//                                       definition: selectedToneDefination,
//                                       example: selectedToneIcon,
//                                       emoji: selectedToneIcon),
//                                   response: ref
//                                       .watch(geminiApiProvider)
//                                       .chatHistory
//                                       .map((e) => e.message)
//                                       .toList()),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//         bottomSheet: Container(
//           color: context.scaffoldBackgroundColor,
//           padding: EdgeInsets.symmetric(horizontal: 16.w),
//           height: 90.h,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               InkWell(
//                 overlayColor:
//                     // ignore: deprecated_member_use
//                     MaterialStateProperty.all(MyColors.transparentColor),
//                 onTap: () {
//                   setState(() {
//                     isChatView = !isChatView;
//                   });
//                 },
//                 child: CircleAvatar(
//                   radius: 29.r,
//                   backgroundColor: context.secondary,
//                   child: SvgPicture.asset(
//                       isChatView ? AppAssets.chatSvg : AppAssets.codeSvg,
//                       width: 32.w,
//                       height: 32.h,
//                       colorFilter: ColorFilter.mode(
//                         context.whiteColor,
//                         BlendMode.srcIn,
//                       )),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   if (isChatView) {
//                     if (chatCtr.text.isNotEmpty) {
//                       setState(() {
//                         chatFocus.unfocus();
//                         isGenerating = true;
//                         isLoadData = false;
//                         messageCount++;
//                       });

//                       ref
//                           .watch(geminiApiProvider)
//                           .sendTextMessage(
//                               chatCtr.text,
//                               messageCount,
//                               ToneOption(
//                                   label: selectedTone,
//                                   definition: selectedToneDefination,
//                                   example: selectedToneIcon,
//                                   emoji: selectedToneIcon),
//                               ref
//                                   .watch(sharePrefProvider)
//                                   .chatHistoryList
//                                   .map((e) => "${e.type}:${e.message}")
//                                   .toList(),
//                               ref.watch(sharePrefProvider).userInfo)
//                           .whenComplete(() {
//                         setState(() {
//                           isLoadData = true;
//                           isGenerating = false;
//                         });
//                         ref
//                             .watch(sharePrefProvider)
//                             .saveChatHistoryList(ChatHistortModel(
//                               id: Random().nextInt(100000).toString(),
//                               message: chatCtr.text,
//                               time: DateTime.now().toString(),
//                               tone: selectedTone,
//                             ));
//                       });
//                     } else {
//                       showToast(msg: "Veuillez entrer un message");
//                     }
//                   } else {
//                     if (chatCtr.text.isNotEmpty && base64Image != null) {
//                       setState(() {
//                         chatFocus.unfocus();
//                         isGenerating = true;
//                         isLoadData = false;
//                         messageCount++;
//                       });
//                       ref
//                           .watch(geminiApiProvider)
//                           .sendTextWithImage(
//                               chatCtr.text,
//                               messageCount,
//                               ToneOption(
//                                   label: selectedTone,
//                                   definition: selectedToneDefination,
//                                   example: selectedToneIcon,
//                                   emoji: selectedToneIcon),
//                               ref
//                                   .watch(sharePrefProvider)
//                                   .chatHistoryModelList
//                                   .map((e) => e.message!)
//                                   .toList(),
//                               ref.watch(sharePrefProvider).userInfo,
//                               base64Image!)
//                           .whenComplete(() {
//                         setState(() {
//                           isLoadData = true;
//                           isGenerating = false;
//                         });
//                       });
//                       ref
//                           .watch(sharePrefProvider)
//                           .saveChatHistoryList(ChatHistortModel(
//                             id: Random().nextInt(100000).toString(),
//                             message: chatCtr.text,
//                             time: DateTime.now().toString(),
//                             tone: selectedTone,
//                             imageUrl: base64Image,
//                           ));
//                     } else {
//                       showToast(msg: "Veuillez entrer un message et une image");
//                     }
//                   }
//                 },
//                 child: Container(
//                   height: 58.h,
//                   width: 232.w,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(45.r),
//                     color: context.secondary,
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.asset(
//                           isLoadData ? AppAssets.reload : AppAssets.magicIcon,
//                           width: 24.w,
//                           height: 24.h),
//                       padding16,
//                       Text(
//                         isLoadData ? "Régénérer" : 'Générer',
//                         style: TextStyle(
//                           fontFamily: AppConstants.fontFamily,
//                           fontSize: MyFonts.size22,
//                           color: context.whiteColor,
//                           fontWeight: FontWeightManager.medium,
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 overlayColor:
//                     // ignore: deprecated_member_use
//                     MaterialStateProperty.all(MyColors.transparentColor),
//                 onTap: () {
//                   showSimpleBottom(
//                       context: context,
//                       content: ToneBottomSheet(
//                         onSelectTone: (val) {
//                           setState(() {
//                             selectedTone = val.label;
//                             selectedToneIcon = val.emoji;
//                             selectedToneDefination = val.definition;
//                             toneExample = val.example;
//                           });
//                         },
//                       ),
//                       height: 750.h);
//                 },
//                 child: CircleAvatar(
//                   radius: 29.r,
//                   backgroundColor: context.secondary,
//                   child: Image.asset(
//                     selectedToneIcon,
//                     width: 44.w,
//                     height: 44.h,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

class DmaxScreen extends ConsumerStatefulWidget {
  const DmaxScreen({
    super.key,
    required this.isLoadData,
    required this.isFromChat,
  });

  final bool isLoadData;
  final bool isFromChat;

  @override
  ConsumerState<DmaxScreen> createState() => _DmaxScreenState();
}

class _DmaxScreenState extends ConsumerState<DmaxScreen> {
  bool isGenerating = false;
  bool isLoadData = false;
  String? imagePath;
  String? base64Image;

  int messageCount = 2;

  late TextEditingController chatCtr;
  final FocusNode chatFocus = FocusNode();

  final FocusNode saReponseFocus = FocusNode();
  final FocusNode maReponseFocus = FocusNode();

  final TextEditingController myMessageCtr = TextEditingController();
  final TextEditingController otherMessageCtr = TextEditingController();

  bool isSaFocused = false;
  bool isMaFocused = false;
  bool isChatFocused = false;
  String goal = '';

  String selectedTone = "Désinvolte";
  String selectedToneIcon = AppAssets.HeartOnFire;
  String selectedToneDefination =
      "Détaché, cool, presque indifférent… mais avec une touche de charme naturel.";
  String toneExample = "Je te laisse croire que t’as l’avantage, c’est mignon.";
  bool isChatView = false;

  @override
  void initState() {
    super.initState();

    chatCtr = TextEditingController();
    chatCtr.addListener(() {
      setState(() {}); // Rebuild to react to text input
    });

    chatFocus.addListener(() {
      setState(() {
        isChatFocused = chatFocus.hasFocus;
      });
    });

    saReponseFocus.addListener(() {
      setState(() {
        isSaFocused = saReponseFocus.hasFocus;
        isChatFocused = false;
      });
    });

    maReponseFocus.addListener(() {
      setState(() {
        isMaFocused = maReponseFocus.hasFocus;
        isChatFocused = false;
      });
    });

    isLoadData = widget.isLoadData;
    isChatView = widget.isFromChat;
    getUserInfo();
  }

  @override
  void dispose() {
    chatCtr.dispose();
    myMessageCtr.dispose();
    otherMessageCtr.dispose();
    saReponseFocus.dispose();
    maReponseFocus.dispose();
    super.dispose();
  }

  Future<void> getUserInfo() async {
    final sharePrefController = ref.read(sharePrefProvider);
    await sharePrefController.getProfileInfo();
  }

  void handleGenerate() {
    if (isChatView) {
      if (chatCtr.text.isNotEmpty) {
        setState(() {
          chatFocus.unfocus();
          isGenerating = true;
          isLoadData = false;
          messageCount++;
        });

        ref
            .read(geminiApiProvider)
            .sendTextMessage(
              chatCtr.text,
              messageCount,
              ToneOption(
                label: selectedTone,
                definition: selectedToneDefination,
                example: selectedToneIcon,
                emoji: selectedToneIcon,
              ),
              ref
                  .read(sharePrefProvider)
                  .chatHistoryList
                  .map((e) => "${e.type}:${e.message}")
                  .toList(),
              ref.read(sharePrefProvider).userInfo,
            )
            .whenComplete(() {
          setState(() {
            goal = chatCtr.text;
            chatCtr.clear();
            isLoadData = true;
            isGenerating = false;
          });
          ref.read(sharePrefProvider).saveChatHistoryList(
                ChatHistortModel(
                  id: Random().nextInt(100000).toString(),
                  message: chatCtr.text,
                  time: DateTime.now().toString(),
                  tone: selectedTone,
                ),
              );
        });
      } else {
        showToast(msg: "Veuillez entrer un message");
      }
    } else {
      if (chatCtr.text.isNotEmpty && base64Image != null) {
        setState(() {
          chatFocus.unfocus();
          isGenerating = true;
          isLoadData = false;
          messageCount++;
        });

        ref
            .read(geminiApiProvider)
            .sendTextWithImage(
              chatCtr.text,
              messageCount,
              ToneOption(
                label: selectedTone,
                definition: selectedToneDefination,
                example: selectedToneIcon,
                emoji: selectedToneIcon,
              ),
              ref
                  .read(sharePrefProvider)
                  .chatHistoryModelList
                  .map((e) => e.message!)
                  .toList(),
              ref.read(sharePrefProvider).userInfo,
              base64Image!,
            )
            .whenComplete(() {
          setState(() {
            goal = chatCtr.text;
            chatCtr.clear();
            isLoadData = true;
            isGenerating = false;
          });
        });

        ref.read(sharePrefProvider).saveChatHistoryList(
              ChatHistortModel(
                id: Random().nextInt(100000).toString(),
                message: chatCtr.text,
                time: DateTime.now().toString(),
                tone: selectedTone,
                imageUrl: base64Image,
              ),
            );
      } else {
        showToast(msg: "Veuillez entrer un message et une image");
      }
    }
  }

  Widget buildChatInput() {
    return Container(
      color: context.scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      height: 90.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isChatView = !isChatView;
              });
            },
            child: CircleAvatar(
              radius: 29.r,
              backgroundColor: context.secondary,
              child: SvgPicture.asset(
                isChatView ? AppAssets.chatSvg : AppAssets.codeSvg,
                width: 32.w,
                height: 32.h,
                colorFilter:
                    ColorFilter.mode(context.whiteColor, BlendMode.srcIn),
              ),
            ),
          ),
          InkWell(
            onTap: handleGenerate,
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
                    height: 24.h,
                  ),
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
          InkWell(
            onTap: () {
              showSimpleBottom(
                context: context,
                content: ToneBottomSheet(
                  onSelectTone: (val) {
                    setState(() {
                      selectedTone = val.label;
                      selectedToneIcon = val.emoji;
                      selectedToneDefination = val.definition;
                      toneExample = val.example;
                    });
                  },
                ),
                height: 750.h,
              );
            },
            child: CircleAvatar(
              radius: 29.r,
              backgroundColor: context.secondary,
              child: Image.asset(
                selectedToneIcon,
                width: 44.w,
                height: 44.h,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                        padding8,
                        isChatView
                            ? ChatViewWidget(
                                myMessageCtr: myMessageCtr,
                                saReponseFocus: saReponseFocus,
                                maReponseFocus: maReponseFocus,
                                isSaFocused: isSaFocused,
                                isMaFocused: isMaFocused,
                              )
                            : AddScreenShort(
                                onBase64Ready: (encoded) {
                                  setState(() {
                                    base64Image = encoded;
                                  });
                                },
                                isGenerating: isGenerating,
                              ),
                        padding6,
                        Row(
                          mainAxisAlignment: isLoadData
                              ? MainAxisAlignment.center
                              : MainAxisAlignment.start,
                          children: [
                            SvgPicture.asset(AppAssets.goalSvg,
                                width: 20.w, height: 20.h),
                            padding8,
                            Text(
                              'Contexte et Objectif',
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontFamily: AppConstants.fontFamily,
                                    fontWeight: FontWeightManager.medium,
                                    color: context.secondary)),
                          ],
                        ),
                        padding8,
                        isLoadData
                            ? Container(
                                width: 361.w,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10.h, horizontal: 15.w),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color:
                                          context.secondary.withOpacity(0.6)),
                                  borderRadius: BorderRadius.circular(12.r),
                                  color: context.whiteColor,
                                ),
                                child: Center(
                                  child: Text(
                                    goal,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeightManager.medium,
                                      color: context.secondary,
                                    ),
                                  ),
                                ),
                              )
                            : CustomTextField(
                                focusNode: chatFocus,
                                verticalPadding: 10,
                                verticalMargin: 0,
                                texFieldHeight: 40.h,
                                controller: chatCtr,
                                borderColor: context.secondary,
                                hintText: "Dis moi ce que tu veux ...",
                                maxLines: 5,
                              ),
                        padding12,
                        isLoadData
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
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(
                                    AppAssets.growSvg,
                                    width: 20.w,
                                    height: 20.h,
                                    fit: BoxFit.fill,
                                  ),
                                  padding8,
                                  Text("Exploration des Possibilités",
                                      style: TextStyle(
                                          fontSize: 16.sp,
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeightManager.medium,
                                          color: context.secondary)),
                                ],
                              ),
                        padding12,
                        !isLoadData
                            ? DottedAnimation(isGenerated: isGenerating)
                            : LoadData(
                                toneOption: ToneOption(
                                  label: selectedTone,
                                  definition: selectedToneDefination,
                                  example: selectedToneIcon,
                                  emoji: selectedToneIcon,
                                ),
                                response: ref
                                    .watch(geminiApiProvider)
                                    .chatHistory
                                    .map((e) => e.message)
                                    .toList(),
                              ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet:
          (isChatFocused || chatCtr.text.isNotEmpty) ? buildChatInput() : null,
      bottomNavigationBar:
          (!isChatFocused && chatCtr.text.isEmpty) ? buildChatInput() : null,
    );
  }
}
