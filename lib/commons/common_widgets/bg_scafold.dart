import 'package:dmax_app/commons/common_imports/common_libs.dart';

class BackgroundBody extends StatelessWidget {
  const BackgroundBody({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.sh,
      width: 1.sw,
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.background),
        fit: BoxFit.fill,
      )),
      child: child,
    );
  }
}
