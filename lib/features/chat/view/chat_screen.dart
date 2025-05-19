import 'dart:math';
import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/commons/common_widgets/CustomTextFields.dart';
import 'package:dmax_app/commons/common_widgets/bg_scafold.dart';
import 'package:dmax_app/commons/common_widgets/show_bottom_sheet.dart';
import 'package:dmax_app/commons/common_widgets/show_toast.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/commons/common_widgets/app_bar.dart';
import 'package:dmax_app/commons/common_widgets/dotted_animation.dart';
import 'package:dmax_app/commons/common_widgets/load_data.dart';
import 'package:dmax_app/features/chat/controller/gemini_controller.dart';
import 'package:dmax_app/features/chat/widgets/messages.dart';
import 'package:dmax_app/features/chat/widgets/tone_bottom_sheet.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/model/chat_histort_model.dart';
import 'package:dmax_app/model/message_model.dart';
import 'package:dmax_app/model/tone_option.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatScreen extends ConsumerStatefulWidget {
  const ChatScreen({super.key, required this.isLoadData});
  final bool isLoadData;

  @override
  ConsumerState<ChatScreen> createState() => _DmaxScreenState();
}

class _DmaxScreenState extends ConsumerState<ChatScreen> {
  bool isGenerating = false;
  bool isLoadData = false;
  int messageCount = 2;
  String selectedTone = "Désinvolte";
  String selectedToneIcon = AppAssets.HeartOnFire;
  String selectedToneDefination =
      "Détaché, cool, presque indifférent… mais avec une touche de charme naturel. C’est le ton de quelqu’un qui n’a rien à prouver, qui reste toujours au-dessus de la mêlée.";
  String toneExample = "Je te laisse croire que t’as l’avantage, c’est mignon.";

  late TextEditingController chatCtr;
  final FocusNode saReponseFocus = FocusNode();
  final FocusNode maReponseFocus = FocusNode();

  final TextEditingController myMessageCtr = TextEditingController();
  final TextEditingController otherMessageCtr = TextEditingController();

  bool isSaFocused = false;
  bool isMaFocused = false;

  @override
  void initState() {
    super.initState();
    chatCtr = TextEditingController();
    getUserInfo();
    saReponseFocus.addListener(() {
      setState(() {
        isSaFocused = saReponseFocus.hasFocus;
      });
    });

    maReponseFocus.addListener(() {
      setState(() {
        isMaFocused = maReponseFocus.hasFocus;
      });
    });
    isLoadData = widget.isLoadData;
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

  getUserInfo() async {
    final sharePrefController = ref.read(sharePrefProvider);
    await sharePrefController.getProfileInfo();
  }

  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width - 40.w;
    final double halfWidth = (fullWidth - 8) / 2;

    return WillPopScope(
      onWillPop: () async {
        if (isSaFocused) {
          saReponseFocus.unfocus();
          return false;
        } else if (isMaFocused) {
          maReponseFocus.unfocus();
          return false;
        }
        isLoadData = false;
        return true;
      },
      child: Scaffold(
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
                                    color: const Color(0xff1E1E1E)
                                        .withOpacity(0.2),
                                    width: 0.5),
                                borderRadius: BorderRadius.circular(12.r),
                                color: context.whiteColor,
                              ),
                              child: Center(
                                child: Text(
                                  "Veuillez entrer au moins un message pour obtenir des réponses.",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: AppConstants.fontFamily,
                                    fontWeight: FontWeightManager.medium,
                                    color: context.secondary.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ),
                            padding12,
                            const Messages(),
                            SingleChildScrollView(
                              child: Row(
                                children: [
                                  if (!isMaFocused)
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 0),
                                      width:
                                          isSaFocused ? fullWidth : halfWidth,
                                      height: 42,
                                      margin: EdgeInsets.only(
                                          right: isSaFocused ? 0 : 8),
                                      decoration: BoxDecoration(
                                        color: context.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: context.blackColor
                                                .withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        focusNode: saReponseFocus,
                                        controller: myMessageCtr,
                                        onFieldSubmitted: (value) {
                                          saReponseFocus.unfocus();
                                          if (myMessageCtr.text
                                              .trim()
                                              .isEmpty) {
                                            return;
                                          }

                                          final newMessage = MessageModel(
                                            message: value.trim(),
                                            type: 'otherPerson',
                                          );
                                          ref
                                              .read(sharePrefProvider)
                                              .addMessage(newMessage);
                                          myMessageCtr.clear();
                                        },
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeightManager.medium,
                                          color: context.secondary
                                              .withOpacity(0.6),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Sa réponse",
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeightManager.bold,
                                            color: context.secondary
                                                .withOpacity(0.6),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 8.h, left: 10.w),
                                        ),
                                      ),
                                    ),
                                  if (!isSaFocused)
                                    AnimatedContainer(
                                      duration: const Duration(milliseconds: 0),
                                      width:
                                          isMaFocused ? fullWidth : halfWidth,
                                      height: 42,
                                      margin: EdgeInsets.only(
                                          left: isMaFocused ? 0 : 8),
                                      decoration: BoxDecoration(
                                        color: context.whiteColor,
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: context.blackColor
                                                .withOpacity(0.1),
                                            blurRadius: 10,
                                            offset: const Offset(0, 1),
                                          ),
                                        ],
                                      ),
                                      child: TextFormField(
                                        focusNode: maReponseFocus,
                                        controller: myMessageCtr,
                                        onFieldSubmitted: (value) {
                                          maReponseFocus.unfocus();
                                          if (myMessageCtr.text
                                              .trim()
                                              .isEmpty) {
                                            return;
                                          }

                                          final newMessage = MessageModel(
                                            message: value.trim(),
                                            type: 'user',
                                          );
                                          ref
                                              .read(sharePrefProvider)
                                              .addMessage(newMessage);
                                          myMessageCtr.clear();
                                        },
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: AppConstants.fontFamily,
                                          fontWeight: FontWeightManager.medium,
                                          color: context.secondary
                                              .withOpacity(0.6),
                                        ),
                                        decoration: InputDecoration(
                                          hintText: "Ma réponse",
                                          hintStyle: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight: FontWeightManager.bold,
                                            color: context.secondary
                                                .withOpacity(0.6),
                                          ),
                                          border: InputBorder.none,
                                          contentPadding: EdgeInsets.only(
                                              bottom: 8.h, left: 10.w),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            ref
                                    .watch(sharePrefProvider)
                                    .chatHistoryList
                                    .isNotEmpty
                                ? Container()
                                : padding125,
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
                                        color:
                                            context.secondary.withOpacity(0.6),
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
                                    controller: chatCtr,
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
                                        color:
                                            context.secondary.withOpacity(0.6),
                                      ),
                                      Text(
                                        '    Masterclass à envoyer    ',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontFamily: AppConstants.fontFamily,
                                            fontWeight:
                                                FontWeightManager.medium,
                                            color: context.secondary),
                                      ),
                                      Container(
                                        height: 1.h,
                                        width: 80.w,
                                        color:
                                            context.secondary.withOpacity(0.6),
                                      ),
                                    ],
                                  )
                                : Container(),
                            !isLoadData
                                ? DottedAnimation(
                                    isGenerated: isGenerating,
                                  )
                                : LoadData(
                                    toneOption: ToneOption(
                                        label: selectedTone,
                                        definition: selectedToneDefination,
                                        example: selectedToneIcon,
                                        emoji: selectedToneIcon),
                                    response: ref
                                        .watch(geminiApiProvider)
                                        .chatHistory
                                        .map((e) => e.message)
                                        .toList()),
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
                    if (chatCtr.text.isNotEmpty) {
                      setState(() {
                        isGenerating = true;
                        isLoadData = false;
                        messageCount++;
                      });

                      ref
                          .watch(geminiApiProvider)
                          .sendTextMessage(
                              chatCtr.text,
                              messageCount,
                              ToneOption(
                                  label: selectedTone,
                                  definition: selectedToneDefination,
                                  example: selectedToneIcon,
                                  emoji: selectedToneIcon),
                              ref
                                  .watch(sharePrefProvider)
                                  .chatHistoryList
                                  .map((e) => "${e.type}:${e.message}")
                                  .toList(),
                              ref.watch(sharePrefProvider).userInfo)
                          .whenComplete(() {
                        setState(() {
                          isLoadData = true;
                          isGenerating = false;
                        });
                        ref
                            .watch(sharePrefProvider)
                            .saveChatHistoryList(ChatHistortModel(
                              id: Random().nextInt(100000).toString(),
                              message: chatCtr.text,
                              time: DateTime.now().toString(),
                              tone: selectedTone,
                            ));
                      });
                    } else {
                      showToast(msg: "Veuillez entrer un message");
                    }
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
                InkWell(
                  overlayColor:
                      // ignore: deprecated_member_use
                      MaterialStateProperty.all(MyColors.transparentColor),
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
                        height: 750.h);
                  },
                  child: CircleAvatar(
                    radius: 29.r,
                    backgroundColor: context.secondary,
                    child: Image.asset(
                      selectedToneIcon,
                      width: 33.w,
                      height: 33.h,
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
