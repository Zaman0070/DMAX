import 'package:dmax_app/commons/common_imports/common_libs.dart';
import 'package:dmax_app/features/all_chat/view/all_chat_history_screen.dart';
import 'package:dmax_app/features/dmax/view/dmax_screen.dart';
import 'package:dmax_app/features/home/view/home_screen.dart';

import '../../../../commons/common_imports/apis_commons.dart';

final mainMenuProvider = ChangeNotifierProvider((ref) => MainMenuController());

class MainMenuController extends ChangeNotifier {
  List<Widget> screens = [
    const HomeScreen(),
    const DmaxScreen(isLoadData: false, isFromChat: false),
    const AllChatHistoryScreen(),
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
