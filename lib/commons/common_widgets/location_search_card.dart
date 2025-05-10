// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/models/location_model/location_model.dart';
// import 'package:flutter_svg/svg.dart';

// class LocationSearchCard extends StatelessWidget {
//   final LocationModel location;
//   final bool? isSelected;
//   const LocationSearchCard({
//     super.key,
//     required this.location,
//     this.isSelected,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: (isSelected ?? false) ? context.primary.withOpacity(.1) : null,
//           borderRadius: BorderRadius.circular(12.r)),
//       padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(AppAssets.resultSvgIcon,
//                   width: 16.w, height: 18.h),
//               padding12,
//               Text(location.mainText,
//                   style: getSemiBoldStyle(
//                       color: context.blackColor, fontSize: MyFonts.size16))
//             ],
//           ),
//           Text(location.secondaryText,
//               style: getSemiBoldStyle(
//                   color: context.bodyTextColor, fontSize: MyFonts.size14))
//         ],
//       ),
//     );
//   }
// }
