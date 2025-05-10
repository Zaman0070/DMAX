// import 'package:dmax_app/core/extensions/color_extensions.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../utils/constants/app_constants.dart';
// import '../common_functions/padding.dart';
// import '../common_imports/apis_commons.dart';
// import '../common_imports/common_libs.dart';
// import 'custom_button.dart';

// class CustomDialog extends StatelessWidget {
//   const CustomDialog({
//     super.key,
//     required this.title,
//     required this.desc,
//     required this.buttonText,
//     required this.onPress,
//   });

//   final String desc;
//   final String title;
//   final String buttonText;
//   final Function() onPress;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30.r),
//       ),
//       backgroundColor: MyColors.lightGreen,
//       child: Container(
//         padding: EdgeInsets.all(AppConstants.padding),
//         decoration: BoxDecoration(
//           color:
//               Theme.of(context).colorScheme.primaryContainer.withOpacity(0.9),
//           borderRadius: BorderRadius.circular(30.r),
//           boxShadow: [
//             BoxShadow(
//               color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
//               // spreadRadius: 12,
//               blurRadius: 8,
//               offset: const Offset(2, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: SvgPicture.asset(AppAssets.closeSvgIcon,
//                       width: 38.w, height: 38.h),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 12.h,
//             ),
//             SvgPicture.asset(
//               AppAssets.infoSvgIcon,
//               width: 86.w,
//               height: 86.h,
//               color: context.errorColor,
//             ),
//             SizedBox(
//               height: 32.h,
//             ),
//             Text(
//              title,
//               textAlign: TextAlign.center,
//               style: getSemiBoldStyle(
//                   color: Theme.of(context).colorScheme.primary,
//                   fontSize: MyFonts.size18),
//             ),
//             SizedBox(
//               height: 8.h,
//             ),
//             Text(
//               desc,
//               textAlign: TextAlign.center,
//               style: getRegularStyle(
//                   color: Theme.of(context).colorScheme.primary,
//                   fontSize: MyFonts.size14),
//             ),
//             SizedBox(
//               height: 32.h,
//             ),
//             Consumer(
//               builder: (BuildContext context, WidgetRef ref, Widget? child) {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CustomButton(
//                       // isLoading: ref.watch(authControllerProvider),
//                       buttonWidth: 132.w,
//                       buttonHeight: 42.h,
//                       padding: 12.r,
//                       backColor: context.primary,
//                       onPressed: onPress,
//                       //     () async {
//                       //   ref.read(authControllerProvider.notifier)
//                       //       .logout(context: context);
//                       //   // Navigator.pop(context);
//                       //   // Navigator.pushNamed(context, AppRoutes.introductionScreen);
//                       // },
//                       buttonText: buttonText,
//                     ),
//                     padding12,
//                     CustomButton(
//                       buttonWidth: 100.w,
//                       buttonHeight: 42.h,
//                       borderColor: context.primary,
//                       textColor: context.primary,
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       buttonText: 'No',
//                     ),
//                   ],
//                 );
//               },
//             ),
//             SizedBox(
//               height: 38.h,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
