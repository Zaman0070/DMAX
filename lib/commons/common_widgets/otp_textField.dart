import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';

class OtpTextFiel extends StatelessWidget {
  const OtpTextFiel({super.key, required this.controller});
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.h,
      width: 55.w,
      decoration: BoxDecoration(
        color: context.whiteColor,
        borderRadius: BorderRadius.all(
          Radius.circular(8.r),
        ),
        border: Border.all(color: context.blackColor.withOpacity(0.2)),
      ),
      child: TextField(
        style:
            getSemiBoldStyle(color: context.primary, fontSize: MyFonts.size18),
        controller: controller,
        maxLength: 1,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          fillColor: context.textFieldColor,
          filled: true,
          contentPadding: const EdgeInsets.only(bottom: 6, left: 2),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}
