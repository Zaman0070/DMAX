import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/core/extensions/color_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CommonSocialButton extends StatelessWidget {
  const CommonSocialButton(
      {super.key, required this.socialIcon, required this.onPressed});
  final String socialIcon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
          height: 47.h,
          width: 47.h,
          decoration: BoxDecoration(
            color: context.textFieldColor,
            shape: BoxShape.circle,
            border: Border.all(
                color: context.blackColor.withOpacity(0.2), width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: SvgPicture.asset(
              socialIcon,
              height: 20.h,
              width: 20.w,
            ),
          )),
    );
  }
}
