// import 'package:botswanasmarketplace/commons/common_imports/apis_commons.dart';
// import 'package:botswanasmarketplace/commons/common_imports/common_libs.dart';
// import 'package:botswanasmarketplace/core/extensions/color_extensions.dart';
// import 'package:botswanasmarketplace/features/auth/controller/auth_notifier_controller.dart';
// import 'package:botswanasmarketplace/routes/route_manager.dart';
// import 'package:botswanasmarketplace/utils/constants/assets_manager.dart';
// import 'package:botswanasmarketplace/utils/constants/font_manager.dart';
// import 'package:botswanasmarketplace/utils/loading.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:geocoding/geocoding.dart';

// class UCommonAppBar extends ConsumerStatefulWidget
//     implements PreferredSizeWidget {
//   const UCommonAppBar({Key? key}) : super(key: key);

//   @override
//   ConsumerState<UCommonAppBar> createState() => _UCommonAppBarState();

//   @override
//   Size get preferredSize => const Size.fromHeight(60);
// }

// class _UCommonAppBarState extends ConsumerState<UCommonAppBar> {
//   @override
//   Widget build(BuildContext context) {
//     return Consumer(builder: (context, ref, child) {
//       Placemark? location = ref.watch(authNotifierCtr).locationDetails;
//       return AppBar(
//         backgroundColor: context.scaffoldBackgroundColor,
//         automaticallyImplyLeading: false,
//         elevation: 0,
//         title: location == null
//             ? const Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   DotLoading(),
//                 ],
//               )
//             // Column(
//             //     crossAxisAlignment: CrossAxisAlignment.start,
//             //     children: [
//             //       Row(
//             //         children: [
//             //           SvgPicture.asset(AppAssets.maphomeSvgIcon,
//             //               width: 17, height: 17),
//             //           Text(
//             //             'Game City',
//             //             style: getBoldStyle(
//             //                 color: context.blackColor,
//             //                 fontSize: MyFonts.size16),
//             //           ),
//             //           padding8,
//             //           Image.asset(
//             //             AppAssets.arrowdropIcon,
//             //             height: 14.h,
//             //             width: 14.w,
//             //             color: context.lightTextColor,
//             //           ),
//             //         ],
//             //       ),
//             //       Text('  Gaborone, Botswana',
//             //           style: getSemiBoldStyle(
//             //               color: context.primary, fontSize: MyFonts.size10)),
//             //     ],
//             //   )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       SvgPicture.asset(AppAssets.maphomeSvgIcon,
//                           width: 17, height: 17),
//                       Text(
//                         location.subLocality != null
//                             ? location.subLocality!
//                             : location.locality!,
//                         overflow: TextOverflow.ellipsis,
//                         style: getBoldStyle(
//                             color: context.blackColor,
//                             fontSize: MyFonts.size16),
//                       ),
//                     ],
//                   ),
//                   Text('  ${location.locality}, ${location.country}',
//                       style: getSemiBoldStyle(
//                           color: context.primary, fontSize: MyFonts.size10)),
//                 ],
//               ),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: InkWell(
//                 onTap: () {
//                   Navigator.pushNamed(
//                       context, AppRoutes.userHomeNotificationScreen);
//                 },
//                 child: SvgPicture.asset(AppAssets.bellSvgIcon,
//                     width: 20, height: 20)),
//           ),
//         ],
//       );
//     });
//   }
// }
