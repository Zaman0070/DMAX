// import 'dart:ui';
// import 'package:botswanasmarketplace/commons/common_functions/padding.dart';
// import 'package:botswanasmarketplace/commons/common_imports/common_libs.dart';
// import 'package:botswanasmarketplace/commons/common_widgets/custom_button.dart';
// import 'package:botswanasmarketplace/core/extensions/color_extensions.dart';
// import 'package:botswanasmarketplace/utils/constants/assets_manager.dart';
// import 'package:botswanasmarketplace/utils/constants/font_manager.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_svg/flutter_svg.dart';

// import 'package:lottie/lottie.dart';

// class LogoutDialog extends ConsumerWidget {
//   const LogoutDialog({super.key});
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Container(
//         height: 355.h,
//         width: 325.w,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(24.r),
//         ),
//         padding: const EdgeInsets.all(12),
//         child: Scaffold(
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: SvgPicture.asset(AppAssets.closeSvgIcon)),
//                 ],
//               ),
//               Stack(children: [
//                 Opacity(
//                   opacity: 0.6,
//                   child: Lottie.asset(
//                       repeat: true,
//                       animate: true,
//                       AppAssets.logoutLottie,
//                       width: 100.w,
//                       height: 100.h,
//                       fit: BoxFit.cover),
//                 ),
//                 ClipRect(
//                     child: BackdropFilter(
//                   filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//                   child: Lottie.asset(
//                       repeat: false,
//                       animate: true,
//                       AppAssets.logoutLottie,
//                       width: 100.w,
//                       height: 100.h,
//                       fit: BoxFit.cover),
//                 ))
//               ]),
//               padding16,
//               Text('Are you sure you want to logout?',
//                   textAlign: TextAlign.center,
//                   style: getSemiBoldStyle(
//                       color: context.whiteColor, fontSize: MyFonts.size17)),
//               padding16,
//               CustomButton(
//                 onPressed: () {},
//                 buttonText: 'Continue',
//                 backColor: context.primary,
//                 buttonHeight: 50.h,
//                 borderRadius: 100.r,
//               ),
//               padding12,
//               InkWell(
//                 onTap: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('Maybe Later',
//                     style: getSemiBoldUnderlineStyle(
//                         color: context.whiteColor, fontSize: MyFonts.size14)),
//               ),
//             ],
//           ),
//         ));
//   }
// }
