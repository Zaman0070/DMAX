import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/chat/widgets/messages.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/model/message_model.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class ChatViewWidget extends ConsumerStatefulWidget {
  const ChatViewWidget({
    super.key,
    required this.myMessageCtr,
    required this.saReponseFocus,
    required this.maReponseFocus,
    required this.isSaFocused,
    required this.isMaFocused,
  });
  final TextEditingController myMessageCtr;
  final FocusNode saReponseFocus;
  final FocusNode maReponseFocus;
  final bool isSaFocused;
  final bool isMaFocused;
  @override
  ConsumerState<ChatViewWidget> createState() => _ChatViewWidgetState();
}

class _ChatViewWidgetState extends ConsumerState<ChatViewWidget> {
  @override
  Widget build(BuildContext context) {
    final double fullWidth = MediaQuery.of(context).size.width - 40.w;
    final double halfWidth = (fullWidth - 8) / 2;
    return Column(
      children: [
        Container(
          height: 36.h,
          width: 361.w,
          decoration: BoxDecoration(
            border: Border.all(
                color: const Color(0xff1E1E1E).withOpacity(0.2), width: 0.5),
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
              if (!widget.isMaFocused)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  width: widget.isSaFocused ? fullWidth : halfWidth,
                  height: 42,
                  margin: EdgeInsets.only(right: widget.isSaFocused ? 0 : 8),
                  decoration: BoxDecoration(
                    color: context.whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: context.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    focusNode: widget.saReponseFocus,
                    controller: widget.myMessageCtr,
                    onFieldSubmitted: (value) {
                      widget.saReponseFocus.unfocus();
                      if (widget.myMessageCtr.text.trim().isEmpty) {
                        return;
                      }

                      final newMessage = MessageModel(
                        message: value.trim(),
                        type: 'otherPerson',
                      );
                      ref.read(sharePrefProvider).addMessage(newMessage);
                      widget.myMessageCtr.clear();
                    },
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeightManager.medium,
                      color: context.secondary.withOpacity(0.6),
                    ),
                    decoration: InputDecoration(
                      hintText: "Sa réponse",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeightManager.bold,
                        color: context.secondary.withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 8.h, left: 10.w),
                    ),
                  ),
                ),
              if (!widget.isSaFocused)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 0),
                  width: widget.isMaFocused ? fullWidth : halfWidth,
                  height: 42,
                  margin: EdgeInsets.only(left: widget.isMaFocused ? 0 : 8),
                  decoration: BoxDecoration(
                    color: context.whiteColor,
                    borderRadius: BorderRadius.circular(8.r),
                    boxShadow: [
                      BoxShadow(
                        color: context.blackColor.withOpacity(0.1),
                        blurRadius: 10,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    focusNode: widget.maReponseFocus,
                    controller: widget.myMessageCtr,
                    onFieldSubmitted: (value) {
                      widget.maReponseFocus.unfocus();
                      if (widget.myMessageCtr.text.trim().isEmpty) {
                        return;
                      }

                      final newMessage = MessageModel(
                        message: value.trim(),
                        type: 'user',
                      );
                      ref.read(sharePrefProvider).addMessage(newMessage);
                      widget.myMessageCtr.clear();
                    },
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeightManager.medium,
                      color: context.secondary.withOpacity(0.6),
                    ),
                    decoration: InputDecoration(
                      hintText: "Ma réponse",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        fontFamily: AppConstants.fontFamily,
                        fontWeight: FontWeightManager.bold,
                        color: context.secondary.withOpacity(0.6),
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(bottom: 8.h, left: 10.w),
                    ),
                  ),
                ),
            ],
          ),
        ),
        ref.watch(sharePrefProvider).chatHistoryList.isNotEmpty
            ? Container()
            : padding125,
        padding12,
      ],
    );
  }
}
