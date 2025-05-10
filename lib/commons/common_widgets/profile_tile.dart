// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:flutter_svg/svg.dart';

// class ProfileTile extends StatelessWidget {
//   const ProfileTile({
//     super.key,
//     required this.title,
//     required this.onPressed,
//     this.icon,
//     this.size = 16,
//   });
//   final String title;
//   final VoidCallback onPressed;
//   final String? icon;
//   final double size;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       // ignore: deprecated_member_use
//       overlayColor: MaterialStateProperty.all(MyColors.transparentColor),
//       onTap: onPressed,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Row(
//               children: [
//                 icon != null
//                     ? SvgPicture.asset(
//                         icon!,
//                         width: 24.w,
//                         height: 24.h,
//                         colorFilter: ColorFilter.mode(
//                             context.blackColor, BlendMode.srcIn),
//                       )
//                     : Container(),
//                 icon != null ? padding12 : Container(),
//                 Container(
//                   constraints: BoxConstraints(
//                     maxWidth: 290.w,
//                   ),
//                   child: Text(
//                     title,
//                     style: getBoldStyle(
//                         color: context.bodyTextColor, fontSize: size.sp),
//                   ),
//                 ),
//               ],
//             ),
//             RotatedBox(
//               quarterTurns: 3,
//               child: Image.asset(
//                 AppAssets.arrowdropIcon,
//                 width: 14.w,
//                 height: 21.h,
//                 color: context.blackColor,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
