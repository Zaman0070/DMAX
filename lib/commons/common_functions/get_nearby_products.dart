// import 'package:botswanasmarketplace/commons/common_functions/location_utils.dart';
// import 'package:botswanasmarketplace/models/seller_service/seller_service_model.dart';

// import '../../features/auth/controller/auth_notifier_controller.dart';
// import '../common_imports/apis_commons.dart';

// List<SellerServiceModel> getNearByProducts(
//     {required WidgetRef ref,
//     required List<SellerServiceModel> products,
//     required double radius}) {
//   final List<SellerServiceModel> nearbyProducts = [];

//   /// app user location
//   final double currentUserLat;
//   final double currentUserLong;

//   final user = ref.read(authNotifierCtr).userModel;
//   currentUserLat = user!.locationDetail!.latitude;
//   currentUserLong = user.locationDetail!.longitude;

//   /// check nearby restaurants
//   for (final SellerServiceModel product in products) {
//     final double merchantLat = product.locationDetails!.latitude;
//     final double merchantLong = product.locationDetails!.longitude;

//     final double distance = LocationUtils.calculateDistance(
//       currentUserLat,
//       currentUserLong,
//       merchantLat,
//       merchantLong,
//     );

//     double maxDistanceKm = radius;
//     if (distance <= maxDistanceKm) {
//       nearbyProducts.add(product);
//     }

//     // if (nearbyProducts.isEmpty) {
//     //   browserCtr.updateMarkers(markers: {});
//     // }
//   }
//   return nearbyProducts;
// }
