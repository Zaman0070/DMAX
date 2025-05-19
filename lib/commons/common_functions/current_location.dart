// import 'package:location/location.dart';

// // get current location and location permission check method
// Future<LocationData?> locationCheck() async {
//   Location location = Location();
//   PermissionStatus permissionGranted;
//   permissionGranted = await location.hasPermission();
//   if (permissionGranted == PermissionStatus.denied) {
//     permissionGranted = await location.requestPermission();
//     if (permissionGranted != PermissionStatus.granted) {
//       // return null;
//     }
//   }
//   bool serviceEnabled = false;
//   serviceEnabled = await location.serviceEnabled();
//   if (!serviceEnabled) {
//     serviceEnabled = await location.requestService();
//     if (!serviceEnabled) {
//       //  return null;
//     }
//   }
//   return await location.getLocation();
// }