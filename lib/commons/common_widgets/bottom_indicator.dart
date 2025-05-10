import 'package:dmax_app/commons/common_imports/common_libs.dart';

class BottomIndicator extends StatelessWidget {
  const BottomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.h,
      width: 134.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: MyColors.lightBoarderColor.withOpacity(0.4),
      ),
    );
  }
}
