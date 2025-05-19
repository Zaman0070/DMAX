// import 'package:dmax_app/commons/common_functions/padding.dart';
// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/commons/common_widgets/cached_retangular_network_image.dart';
// import 'package:dmax_app/commons/common_widgets/show_bottom_sheet.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/features/vendor/events/bottom_sheet/v_event_delete_bottom.dart';
// import 'package:dmax_app/features/vendor/events/dialog/v_event_active_dialog.dart';
// import 'package:dmax_app/models/event_model/event_model.dart';
// import 'package:dmax_app/routes/route_manager.dart';
// import 'package:flutter_popup/flutter_popup.dart';
// import 'package:flutter_svg/svg.dart';

// class CommonCard extends StatelessWidget {
//   const CommonCard({super.key, this.isVendor = false, required this.model});
//   final bool? isVendor;
//   final EventModel model;

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       overlayColor: WidgetStateProperty.all(Colors.transparent),
//       onTap: () {
//         Navigator.pushNamed(
//           context,
//           AppRoutes.eventDetailScreen,
//           arguments: {
//             'model': model,
//             'isSeller': isVendor,
//           },
//         );
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 13.h),
//         margin: const EdgeInsets.all(4),
//         height: 104.h,
//         width: 380.w,
//         decoration: BoxDecoration(
//           color: context.whiteColor,
//           borderRadius: BorderRadius.circular(10.r),
//           boxShadow: [
//             BoxShadow(
//               color: context.blackColor.withOpacity(0.1),
//               blurRadius: 10.r,
//               offset: const Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Row(
//           children: [
//             CachedRectangularNetworkImageWidget(
//               image: model.thumbnail!,
//               width: 91,
//               height: 84,
//               borderRadius: 10,
//             ),
//             padding16,
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   width: 240.w,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         constraints: BoxConstraints(
//                             maxWidth: isVendor == true ? 200.w : 240.w),
//                         child: Text(model.eventName ?? '',
//                             maxLines: 2,
//                             style: getBoldStyle(
//                                 color: context.blackColor,
//                                 fontSize: MyFonts.size18)),
//                       ),
//                       isVendor == true
//                           ? CustomPopup(
//                               barrierColor: context.primary.withOpacity(0.1),
//                               backgroundColor: Colors.white,
//                               content: VEventActiveDialog(
//                                 edit: () {
//                                   Navigator.pop(context);

//                                   Navigator.pushNamed(
//                                     context,
//                                     AppRoutes.vendorEditEventScreen,
//                                     arguments: {
//                                       'model': model,
//                                       // 'subscriptionModel': plan,
//                                     },
//                                   );
//                                 },
//                                 delete: () {
//                                   Navigator.pop(context);
//                                   showSimpleBottom(
//                                       context: context,
//                                       content:
//                                           VEventDeleteBottomSheet(model: model),
//                                       height: 300.h);
//                                 },
//                               ),
//                               child: Image.asset(AppAssets.moreverIcon,
//                                   height: 24.h, width: 24.w))
//                           : const SizedBox.shrink(),
//                     ],
//                   ),
//                 ),
//                 padding16,
//                 Container(
//                   constraints: BoxConstraints(maxWidth: 240.w),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           SvgPicture.asset(AppAssets.locationSvgIcon,
//                               height: 20.h, width: 20.w),
//                           padding8,
//                           Text(model.cityLocation ?? '',
//                               style: getRegularStyle(
//                                   color: context.blackColor.withOpacity(0.5),
//                                   fontSize: MyFonts.size15)),
//                         ],
//                       ),
//                       Container(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 16.w, vertical: 8.h),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8.r),
//                           color: context.primary.withOpacity(0.2),
//                         ),
//                         child: Center(
//                           child: Text('\$ ${model.price}.00',
//                               textAlign: TextAlign.center,
//                               style: getRegularStyle(
//                                   color: context.primary,
//                                   fontSize: MyFonts.size14)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
