import 'package:dmax_app/commons/common_imports/apis_commons.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/features/splash/controller/share_pref_controller.dart';
import 'package:dmax_app/model/message_model.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';
import 'package:dmax_app/utils/utils.dart';

class Messages extends ConsumerStatefulWidget {
  const Messages({super.key});

  @override
  ConsumerState<Messages> createState() => _MessagesState();
}

class _MessagesState extends ConsumerState<Messages> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // Load messages and scroll to bottom
    Future.microtask(() async {
      await ref.read(sharePrefProvider).loadChatHistory();
      _scrollToBottom();
    });
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctr = ref.watch(sharePrefProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    if (ctr.isLoading) {
      return const Loading();
    }

    if (ctr.chatHistoryList.isEmpty) {
      return const Center(child: Text(''));
    }

    return Container(
      constraints: BoxConstraints(
        maxHeight: 140.h,
        minHeight: 140.h,
      ),
      child: ListView.builder(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: ctr.chatHistoryList.length,
        itemBuilder: (context, index) {
          MessageModel messagesModel = ctr.chatHistoryList[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: messagesModel.type == "otherPerson"
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
              children: [
                Container(
                  width: 240.w,
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
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                  child: Text(
                    messagesModel.message,
                    style: TextStyle(
                      fontSize: MyFonts.size14,
                      fontFamily: AppConstants.fontFamily,
                      fontWeight: FontWeightManager.medium,
                      color: context.secondary,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
