// import 'package:dmax_app/commons/common_imports/common_libs.dart';
// import 'package:dmax_app/commons/common_widgets/custom_button.dart';
// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:dmax_app/routes/route_manager.dart';

// class CoomonPreminumWidget extends StatelessWidget {
//   const CoomonPreminumWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(top: 12.h),
//       height: 89.h,
//       width: 388.w,
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.r),
//           color: context.textFieldColor,
//           image: const DecorationImage(
//               image: AssetImage(
//                 AppAssets.premiumImage,
//               ),
//               fit: BoxFit.cover)),
//       child: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Buy Premium to get\nunlimited access to all\nfeatures ',
//               style: getSemiBoldStyle(
//                   color: context.blackColor, fontSize: MyFonts.size16),
//             ),
//             CustomButton(
//               onPressed: () {
//                 Navigator.pushNamed(context, AppRoutes.premiumScreen);
//               },
//               buttonText: 'Buy Now',
//               buttonWidth: 128.w,
//               backColor: context.primary,
//               buttonHeight: 56.h,
//               borderRadius: 10.r,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
