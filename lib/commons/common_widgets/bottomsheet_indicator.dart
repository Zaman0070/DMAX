import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

class BottomSheetIndicator extends StatelessWidget {
  const BottomSheetIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 134.w,
        height: 5.h,
        decoration: BoxDecoration(
          color: context.textFieldColor,
          borderRadius: BorderRadius.circular(25.r),
        ));
  }
}
