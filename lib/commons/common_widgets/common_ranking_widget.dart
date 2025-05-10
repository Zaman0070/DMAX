// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/features/vendor/dashboard/widgets/v_pie_chart.dart';
// import 'package:dmax_app/utils/constants/app_constants.dart';

// class CommonRankingWidget extends StatelessWidget {
//   const CommonRankingWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.all(AppConstants.padding),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.r),
//               border: Border.all(color: context.blackColor.withOpacity(0.2)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Guests',
//                   style: getSemiBoldStyle(
//                       color: context.bodyTextColor, fontSize: MyFonts.size20),
//                 ),
//                 padding12,
//                 const VPieChartWidget(),
//                 padding12,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: context.errorColor,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Accepted',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//                 padding8,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: context.primary,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Pending',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//                 padding8,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: MyColors.purple,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Denied',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//         padding12,
//         Expanded(
//           child: Container(
//             padding: EdgeInsets.all(AppConstants.padding),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(12.r),
//               border: Border.all(color: context.blackColor.withOpacity(0.2)),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Vendors',
//                   style: getSemiBoldStyle(
//                       color: context.bodyTextColor, fontSize: MyFonts.size20),
//                 ),
//                 padding12,
//                 const VPieChartWidget(),
//                 padding12,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: context.errorColor,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Accepted',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//                 padding8,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: context.primary,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Pending',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//                 padding8,
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 5.r,
//                       backgroundColor: MyColors.purple,
//                     ),
//                     padding8,
//                     Text(
//                       '0 Denied',
//                       style: getMediumStyle(
//                           color: context.bodyTextColor,
//                           fontSize: MyFonts.size14),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
