import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/features/dmax/view/dmax_screen.dart';
import 'package:dmax_app/features/home/view/home.dart';

import '../../../../commons/common_imports/apis_commons.dart';

final mainMenuProvider = ChangeNotifierProvider((ref) => MainMenuController());

class MainMenuController extends ChangeNotifier {
  List<Widget> screens = [
    const HomeScreen(),
    const DmaxScreen(),
    Center(
      child: Text(
        "Work in Progress",
        style: TextStyle(fontSize: 20.sp),
      ),
    ),
  ];

  int _index = 0;
  int get index => _index;
  late PageController pageController = PageController();
  setIndex(int id) {
    _index = id;
    pageController.jumpToPage(id);
    notifyListeners();
  }
}
