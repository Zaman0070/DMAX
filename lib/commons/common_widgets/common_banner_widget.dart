// import 'package:botswanasmarketplace/commons/common_imports/apis_commons.dart';
// import 'package:botswanasmarketplace/commons/common_imports/common_libs.dart';
// import 'package:botswanasmarketplace/commons/common_widgets/cached_retangular_network_image.dart';
// import 'package:botswanasmarketplace/core/constants/app_const.dart';
// import 'package:botswanasmarketplace/core/extensions/color_extensions.dart';
// import 'package:botswanasmarketplace/utils/constants/assets_manager.dart';
// import 'package:flutter_swiper_view/flutter_swiper_view.dart';
//
// class CommonBannerWidget extends ConsumerStatefulWidget {
//   const CommonBannerWidget({
//     super.key,
//   });
//
//   @override
//   ConsumerState<CommonBannerWidget> createState() => _UHomeBannerSectionState();
// }
//
// class _UHomeBannerSectionState extends ConsumerState<CommonBannerWidget> {
//   int _current = 0;
//   List<T> map<T>(List list, Function handler) {
//     List<T> result = [];
//     for (var i = 0; i < list.length; i++) {
//       result.add(handler(i, list[i]));
//     }
//     return result;
//   }
//
//   // List<String> imageBanner = [
//   //   ad00,
//   //   ad01,
//   //   ad02,
//   //   ad03,
//   //   ad04,
//   //   ad05,
//   //   ad06,
//   //   ad07,
//   // ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: 1.sw,
//           height: 180.h,
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(10.r),
//             child: Stack(
//               alignment: Alignment.bottomCenter,
//               children: [
//                 Swiper(
//                   autoplay: AppConst.isSwipe,
//                   outer: false,
//                   indicatorLayout: PageIndicatorLayout.NONE,
//                   itemBuilder: (context, index) {
//                     // return Image.network(imageBanner[index], fit: BoxFit.fill);
//                     return CachedRectangularNetworkImageWidget(
//                         image: imageBanner[index], width: 360, height: 180);
//                   },
//                   onIndexChanged: (value) {
//                     setState(() {
//                       _current = value;
//                     });
//                   },
//                   layout: SwiperLayout.DEFAULT,
//                   itemCount: imageBanner.length,
//                   pagination: const SwiperPagination(
//                       builder: SwiperPagination(
//                     builder: DotSwiperPaginationBuilder(
//                         color: Colors.transparent,
//                         activeColor: Colors.transparent,
//                         size: 10,
//                         activeSize: 10),
//                   )),
//                   control: SwiperControl(
//                     color: MyColors.black.withOpacity(0.0),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 8.h,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: map<Widget>(imageBanner, (value, url) {
//             return Container(
//               width: _current == value ? 16.w : 8.h,
//               height: 8.h,
//               margin: const EdgeInsets.symmetric(horizontal: 3),
//               decoration: BoxDecoration(
//                 borderRadius: _current == value
//                     ? BorderRadius.circular(20.r)
//                     : BorderRadius.circular(20.r),
//                 color: _current == value
//                     ? MyColors.yellow
//                     : context.primary.withOpacity(0.4),
//               ),
//             );
//           }),
//         ),
//       ],
//     );
//   }
// }
