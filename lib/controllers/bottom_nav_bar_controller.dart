import 'package:get/get.dart';

class BottomNavBarController extends GetxController {
  RxInt selectedIndex = 1.obs;

  void changePage(index) {
    selectedIndex.value = index;
  }
}
