// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_imports/apis_commons.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/commons/common_widgets/custom_scafold.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/utils/constants/app_constants.dart';

// class PremiumScreen extends ConsumerStatefulWidget {
//   const PremiumScreen({super.key});

//   @override
//   ConsumerState<PremiumScreen> createState() => _PremiumScreenState();
// }

// class _PremiumScreenState extends ConsumerState<PremiumScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CustomScaffold(
//       isbackgroud: true,
//       child: Scaffold(
//         backgroundColor: MyColors.transparentColor,
//         appBar: AppBar(
//           backgroundColor: MyColors.transparentColor,
//           leading: Consumer(builder: (context, ref, child) {
//             return IconButton(
//               onPressed: () {
//                 // ref.read(usermainMenuProvider).setIndex(0);
//                 Navigator.pop(context);
//               },
//               icon: Container(
//                 height: 50.h,
//                 width: 50.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100.r),
//                     color: context.whiteColor),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Image.asset(
//                     AppAssets.backArrowIcon,
//                     width: 20.w,
//                     height: 20.h,
//                     color: context.blackColor,
//                   ),
//                 ),
//               ),
//             );
//           }),
//           centerTitle: true,
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Upgrade To Premium',
//                   style: getMediumStyle(
//                       color: context.blackColor, fontSize: MyFonts.size26)),
//               Text(
//                 'Buy Premium to unlock all features',
//                 style: getRegularStyle(
//                     color: context.blackColor, fontSize: MyFonts.size16),
//               )
//             ],
//           ),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(AppConstants.padding),
//           child: Column(
//             children: [
//               padding40,
//               checkStatus(
//                 status: 'Access to All Features',
//                 context: context,
//                 onPressed: (val) {},
//               ),
//               padding12,
//               checkStatus(
//                 status: 'Customize Everything for yourself',
//                 context: context,
//                 onPressed: (val) {},
//               ),
//               padding12,
//               checkStatus(
//                 status: 'Without ads and notifications',
//                 context: context,
//                 onPressed: (val) {},
//               ),
//               padding12,
//               checkStatus(
//                 status: 'Prepare for the event with friends',
//                 context: context,
//                 onPressed: (val) {},
//               ),
//               padding18,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   card(
//                       context: context,
//                       title: 'Per 1 Month',
//                       price: '\$4.99',
//                       onPressed: () {}),
//                   card(
//                       context: context,
//                       title: 'Per 3 Month',
//                       price: '\$8.99',
//                       offer: true,
//                       offerValue: 'Save 45%',
//                       onPressed: () {}),
//                   card(
//                       context: context,
//                       title: 'Per 6 Month',
//                       price: '\$12.99',
//                       onPressed: () {}),
//                 ],
//               ),
//               padding12,
//               card(
//                 context: context,
//                 title: 'One Time Payment',
//                 price: '\$54.99',
//                 fullAccess: true,
//                 onPressed: () {},
//                 fullAccessValue: 'Get full Access',
//               ),
//               padding16,
//               Container(
//                 decoration: BoxDecoration(
//                   color: context.textFieldColor,
//                   borderRadius: BorderRadius.circular(10.r),
//                 ),
//                 padding: EdgeInsets.all(AppConstants.padding),
//                 child: Column(
//                   children: [
//                     feature(
//                         feature: 'Features',
//                         limit: 'Limit',
//                         premium: 'Premium',
//                         context: context),
//                     padding12,
//                     ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: 5,
//                       itemBuilder: (context, index) {
//                         return Padding(
//                           padding: const EdgeInsets.only(bottom: 8),
//                           child: feature(
//                               feature: 'Feature $index',
//                               limit: 'Limit $index',
//                               premium: 'Premium $index',
//                               context: context,
//                               isHeader: false),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   bool isCheck = false;

//   feature({
//     required String feature,
//     required String limit,
//     required String premium,
//     required BuildContext context,
//     bool? isHeader = true,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         SizedBox(
//           width: 100.w,
//           child: Text(
//             feature,
//             style: getMediumStyle(
//                 color: isHeader == false
//                     ? context.bodyTextColor
//                     : context.blackColor,
//                 fontSize: isHeader == false ? MyFonts.size15 : MyFonts.size17),
//           ),
//         ),
//         SizedBox(
//           width: 100.w,
//           child: Text(
//             textAlign: TextAlign.center,
//             limit,
//             style: getMediumStyle(
//                 color: isHeader == false
//                     ? context.bodyTextColor
//                     : context.blackColor,
//                 fontSize: isHeader == false ? MyFonts.size15 : MyFonts.size17),
//           ),
//         ),
//         SizedBox(
//           width: 100.w,
//           child: Text(
//             textAlign: TextAlign.end,
//             premium,
//             style: getMediumStyle(
//                 color: isHeader == false ? context.primary : context.blackColor,
//                 fontSize: isHeader == false ? MyFonts.size15 : MyFonts.size17),
//           ),
//         ),
//       ],
//     );
//   }

//   card({
//     required BuildContext context,
//     required String title,
//     required String price,
//     bool? offer,
//     bool? fullAccess,
//     String? offerValue,
//     String? fullAccessValue,
//     required VoidCallback onPressed,
//   }) {
//     return InkWell(
//       overlayColor: MaterialStateProperty.all(MyColors.transparentColor),
//       onTap: onPressed,
//       child: Container(
//         height: 97.h,
//         padding: EdgeInsets.symmetric(
//             horizontal: AppConstants.padding, vertical: 10),
//         decoration: BoxDecoration(
//           color: context.secondary,
//           borderRadius: BorderRadius.circular(10.r),
//           border: Border.all(color: context.primary, width: 1),
//         ),
//         child: Row(
//           mainAxisAlignment: fullAccess == true
//               ? MainAxisAlignment.spaceBetween
//               : MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 offer == true
//                     ? Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 6, vertical: 2),
//                         decoration: BoxDecoration(
//                           color: context.primary,
//                           borderRadius: BorderRadius.circular(100.r),
//                         ),
//                         child: Center(
//                           child: Text(
//                             offerValue!,
//                             style: getRegularStyle(
//                                 color: context.whiteColor,
//                                 fontSize: MyFonts.size16),
//                           ),
//                         ),
//                       )
//                     : const SizedBox.shrink(),
//                 Text(
//                   price,
//                   style: getRegularStyle(
//                       color: context.blackColor, fontSize: MyFonts.size26),
//                 ),
//                 padding6,
//                 Text(
//                   title,
//                   style: getRegularStyle(
//                       color: context.blackColor, fontSize: MyFonts.size16),
//                 )
//               ],
//             ),
//             fullAccess == true
//                 ? Container(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: context.primary,
//                       borderRadius: BorderRadius.circular(100.r),
//                     ),
//                     child: Text(
//                       fullAccessValue!,
//                       style: getRegularStyle(
//                           color: context.whiteColor, fontSize: MyFonts.size16),
//                     ),
//                   )
//                 : const SizedBox.shrink(),
//           ],
//         ),
//       ),
//     );
//   }

//   checkStatus({
//     required String status,
//     required BuildContext context,
//     required Function(bool val) onPressed,
//   }) {
//     return InkWell(
//       overlayColor: MaterialStateProperty.all(MyColors.transparentColor),
//       onTap: () {
//         onPressed(isCheck);
//         setState(() {
//           isCheck = !isCheck;
//         });
//       },
//       child: Row(
//         children: [
//           Container(
//             height: 20.h,
//             width: 20.w,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4.r),
//               border: Border.all(color: MyColors.green, width: 1),
//             ),
//             child: Icon(Icons.check,
//                 color: isCheck == true
//                     ? MyColors.green
//                     : context.scaffoldBackgroundColor,
//                 size: 12),
//           ),
//           padding12,
//           Text(status,
//               style: getLightStyle(
//                   color: context.bodyTextColor, fontSize: MyFonts.size16)),
//         ],
//       ),
//     );
//   }
// }
