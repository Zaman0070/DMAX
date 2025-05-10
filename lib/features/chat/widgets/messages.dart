import 'package:dmax_app/commons/common_functions/padding.dart';
import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:dmax_app/utils/constants/app_constants.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<String> data = [
    "You look amazing! ",
    "I love your outfit! ",
    "You are so talented! ",
    "You are so creative! ",
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190.h,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: index == 1 || index == 3
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    width: 240.w,
                    height: 38.h,
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: index == 1 || index == 3
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        padding16,
                        Text(
                          data[index],
                          style: TextStyle(
                            fontSize: MyFonts.size14,
                            fontFamily: AppConstants.fontFamily,
                            fontWeight: FontWeightManager.medium,
                            color: context.secondary,
                          ),
                        ),
                        padding16,
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
